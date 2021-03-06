$NetBSD$

Upstream changeset 92556

--- src/3rdparty/webkit/Source/WebCore/platform/Timer.cpp.orig	2012-11-23 10:09:58.000000000 +0000
+++ src/3rdparty/webkit/Source/WebCore/platform/Timer.cpp
@@ -41,6 +41,8 @@ using namespace std;
 
 namespace WebCore {
 
+class TimerHeapReference;
+
 // Timers are stored in a heap data structure, used to implement a priority queue.
 // This allows us to efficiently determine which timer needs to fire the soonest.
 // Then we set a single shared system timer to fire at that time.
@@ -53,110 +55,138 @@ static Vector<TimerBase*>& timerHeap()
     return threadGlobalData().threadTimers().timerHeap();
 }
 
-// Class to represent elements in the heap when calling the standard library heap algorithms.
-// Maintains the m_heapIndex value in the timers themselves, which allows us to do efficient
-// modification of the heap.
-class TimerHeapElement {
-public:
-    explicit TimerHeapElement(int i)
-        : m_index(i)
-        , m_timer(timerHeap()[m_index])
-    { 
-        checkConsistency(); 
-    }
-
-    TimerHeapElement(const TimerHeapElement&);
-    TimerHeapElement& operator=(const TimerHeapElement&);
-
-    TimerBase* timer() const { return m_timer; }
-
-    void checkConsistency() const
-    {
-        ASSERT(m_index >= 0);
-        ASSERT(m_index < static_cast<int>(timerHeap().size()));
-    }
+// ----------------
 
+class TimerHeapPointer {
+public:
+    TimerHeapPointer(TimerBase** pointer) : m_pointer(pointer) { }
+    TimerHeapReference operator*() const;
+    TimerBase* operator->() const { return *m_pointer; }
 private:
-    TimerHeapElement();
+    TimerBase** m_pointer;
+};
 
-    int m_index;
-    TimerBase* m_timer;
+class TimerHeapReference {
+public:
+    TimerHeapReference(TimerBase*& reference) : m_reference(reference) { }
+    operator TimerBase*() const { return m_reference; }
+    TimerHeapPointer operator&() const { return &m_reference; }
+    TimerHeapReference& operator=(TimerBase*);
+    TimerHeapReference& operator=(TimerHeapReference);
+private:
+    TimerBase*& m_reference;
 };
 
-inline TimerHeapElement::TimerHeapElement(const TimerHeapElement& o)
-    : m_index(-1), m_timer(o.timer())
+inline TimerHeapReference TimerHeapPointer::operator*() const
 {
+    return *m_pointer;
 }
 
-inline TimerHeapElement& TimerHeapElement::operator=(const TimerHeapElement& o)
+inline TimerHeapReference& TimerHeapReference::operator=(TimerBase* timer)
 {
-    TimerBase* t = o.timer();
-    m_timer = t;
-    if (m_index != -1) {
-        checkConsistency();
-        timerHeap()[m_index] = t;
-        t->m_heapIndex = m_index;
-    }
+    m_reference = timer;
+    Vector<TimerBase*>& heap = timerHeap();
+    if (&m_reference >= heap.data() && &m_reference < heap.data() + heap.size())
+        timer->m_heapIndex = &m_reference - heap.data();
     return *this;
 }
 
-inline bool operator<(const TimerHeapElement& a, const TimerHeapElement& b)
+inline TimerHeapReference& TimerHeapReference::operator=(TimerHeapReference b)
 {
-    // The comparisons below are "backwards" because the heap puts the largest 
-    // element first and we want the lowest time to be the first one in the heap.
-    double aFireTime = a.timer()->m_nextFireTime;
-    double bFireTime = b.timer()->m_nextFireTime;
-    if (bFireTime != aFireTime)
-        return bFireTime < aFireTime;
-    
-    // We need to look at the difference of the insertion orders instead of comparing the two 
-    // outright in case of overflow. 
-    unsigned difference = a.timer()->m_heapInsertionOrder - b.timer()->m_heapInsertionOrder;
-    return difference < UINT_MAX / 2;
+    TimerBase* timer = b;
+    return *this = timer;
+}
+
+inline void swap(TimerHeapReference a, TimerHeapReference b)
+{
+    TimerBase* timerA = a;
+    TimerBase* timerB = b;
+
+    // Invoke the assignment operator, since that takes care of updating m_heapIndex.
+    a = timerB;
+    b = timerA;
 }
 
 // ----------------
 
 // Class to represent iterators in the heap when calling the standard library heap algorithms.
-// Returns TimerHeapElement for elements in the heap rather than the TimerBase pointers themselves.
-class TimerHeapIterator : public iterator<random_access_iterator_tag, TimerHeapElement, int> {
+// Uses a custom pointer and reference type that update indices for pointers in the heap.
+class TimerHeapIterator : public iterator<random_access_iterator_tag, TimerBase*, ptrdiff_t, TimerHeapPointer, TimerHeapReference> {
 public:
-    TimerHeapIterator() : m_index(-1) { }
-    TimerHeapIterator(int i) : m_index(i) { checkConsistency(); }
-
-    TimerHeapIterator& operator++() { checkConsistency(); ++m_index; checkConsistency(); return *this; }
-    TimerHeapIterator operator++(int) { checkConsistency(); checkConsistency(1); return m_index++; }
+    explicit TimerHeapIterator(TimerBase** pointer) : m_pointer(pointer) { checkConsistency(); }
 
-    TimerHeapIterator& operator--() { checkConsistency(); --m_index; checkConsistency(); return *this; }
-    TimerHeapIterator operator--(int) { checkConsistency(); checkConsistency(-1); return m_index--; }
+    TimerHeapIterator& operator++() { checkConsistency(); ++m_pointer; checkConsistency(); return *this; }
+    TimerHeapIterator operator++(int) { checkConsistency(1); return TimerHeapIterator(m_pointer++); }
 
-    TimerHeapIterator& operator+=(int i) { checkConsistency(); m_index += i; checkConsistency(); return *this; }
-    TimerHeapIterator& operator-=(int i) { checkConsistency(); m_index -= i; checkConsistency(); return *this; }
+    TimerHeapIterator& operator--() { checkConsistency(); --m_pointer; checkConsistency(); return *this; }
+    TimerHeapIterator operator--(int) { checkConsistency(-1); return TimerHeapIterator(m_pointer--); }
 
-    TimerHeapElement operator*() const { return TimerHeapElement(m_index); }
-    TimerHeapElement operator[](int i) const { return TimerHeapElement(m_index + i); }
+    TimerHeapIterator& operator+=(ptrdiff_t i) { checkConsistency(); m_pointer += i; checkConsistency(); return *this; }
+    TimerHeapIterator& operator-=(ptrdiff_t i) { checkConsistency(); m_pointer -= i; checkConsistency(); return *this; }
 
-    int index() const { return m_index; }
+    TimerHeapReference operator*() const { return TimerHeapReference(*m_pointer); }
+    TimerHeapReference operator[](ptrdiff_t i) const { return TimerHeapReference(m_pointer[i]); }
+    TimerBase* operator->() const { return *m_pointer; }
 
-    void checkConsistency(int offset = 0) const
+private:
+    void checkConsistency(ptrdiff_t offset = 0) const
     {
-        ASSERT_UNUSED(offset, m_index + offset >= 0);
-        ASSERT_UNUSED(offset, m_index + offset <= static_cast<int>(timerHeap().size()));
+        ASSERT(m_pointer >= timerHeap().data());
+        ASSERT(m_pointer <= timerHeap().data() + timerHeap().size());
+        ASSERT_UNUSED(offset, m_pointer + offset >= timerHeap().data());
+        ASSERT_UNUSED(offset, m_pointer + offset <= timerHeap().data() + timerHeap().size());
     }
 
-private:
-    int m_index;
+    friend bool operator==(TimerHeapIterator, TimerHeapIterator);
+    friend bool operator!=(TimerHeapIterator, TimerHeapIterator);
+    friend bool operator<(TimerHeapIterator, TimerHeapIterator);
+    friend bool operator>(TimerHeapIterator, TimerHeapIterator);
+    friend bool operator<=(TimerHeapIterator, TimerHeapIterator);
+    friend bool operator>=(TimerHeapIterator, TimerHeapIterator);
+    
+    friend TimerHeapIterator operator+(TimerHeapIterator, size_t);
+    friend TimerHeapIterator operator+(size_t, TimerHeapIterator);
+    
+    friend TimerHeapIterator operator-(TimerHeapIterator, size_t);
+    friend ptrdiff_t operator-(TimerHeapIterator, TimerHeapIterator);
+
+    TimerBase** m_pointer;
 };
 
-inline bool operator==(TimerHeapIterator a, TimerHeapIterator b) { return a.index() == b.index(); }
-inline bool operator!=(TimerHeapIterator a, TimerHeapIterator b) { return a.index() != b.index(); }
-inline bool operator<(TimerHeapIterator a, TimerHeapIterator b) { return a.index() < b.index(); }
+inline bool operator==(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer == b.m_pointer; }
+inline bool operator!=(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer != b.m_pointer; }
+inline bool operator<(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer < b.m_pointer; }
+inline bool operator>(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer > b.m_pointer; }
+inline bool operator<=(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer <= b.m_pointer; }
+inline bool operator>=(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer >= b.m_pointer; }
+
+inline TimerHeapIterator operator+(TimerHeapIterator a, size_t b) { return TimerHeapIterator(a.m_pointer + b); }
+inline TimerHeapIterator operator+(size_t a, TimerHeapIterator b) { return TimerHeapIterator(a + b.m_pointer); }
 
-inline TimerHeapIterator operator+(TimerHeapIterator a, int b) { return a.index() + b; }
-inline TimerHeapIterator operator+(int a, TimerHeapIterator b) { return a + b.index(); }
+inline TimerHeapIterator operator-(TimerHeapIterator a, size_t b) { return TimerHeapIterator(a.m_pointer - b); }
+inline ptrdiff_t operator-(TimerHeapIterator a, TimerHeapIterator b) { return a.m_pointer - b.m_pointer; }
 
-inline TimerHeapIterator operator-(TimerHeapIterator a, int b) { return a.index() - b; }
-inline int operator-(TimerHeapIterator a, TimerHeapIterator b) { return a.index() - b.index(); }
+// ----------------
+
+class TimerHeapLessThanFunction {
+public:
+    bool operator()(TimerBase*, TimerBase*) const;
+};
+
+inline bool TimerHeapLessThanFunction::operator()(TimerBase* a, TimerBase* b) const
+{
+    // The comparisons below are "backwards" because the heap puts the largest 
+    // element first and we want the lowest time to be the first one in the heap.
+    double aFireTime = a->m_nextFireTime;
+    double bFireTime = b->m_nextFireTime;
+    if (bFireTime != aFireTime)
+        return bFireTime < aFireTime;
+    
+    // We need to look at the difference of the insertion orders instead of comparing the two 
+    // outright in case of overflow. 
+    unsigned difference = a->m_heapInsertionOrder - b->m_heapInsertionOrder;
+    return difference < numeric_limits<unsigned>::max() / 2;
+}
 
 // ----------------
 
@@ -225,7 +255,8 @@ void TimerBase::heapDecreaseKey()
 {
     ASSERT(m_nextFireTime != 0);
     checkHeapIndex();
-    push_heap(TimerHeapIterator(0), TimerHeapIterator(m_heapIndex + 1));
+    TimerBase** heapData = timerHeap().data();
+    push_heap(TimerHeapIterator(heapData), TimerHeapIterator(heapData + m_heapIndex + 1), TimerHeapLessThanFunction());
     checkHeapIndex();
 }
 
@@ -274,7 +305,9 @@ void TimerBase::heapPopMin()
 {
     ASSERT(this == timerHeap().first());
     checkHeapIndex();
-    pop_heap(TimerHeapIterator(0), TimerHeapIterator(timerHeap().size()));
+    Vector<TimerBase*>& heap = timerHeap();
+    TimerBase** heapData = heap.data();
+    pop_heap(TimerHeapIterator(heapData), TimerHeapIterator(heapData + heap.size()), TimerHeapLessThanFunction());
     checkHeapIndex();
     ASSERT(this == timerHeap().last());
 }
