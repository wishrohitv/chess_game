void swap(List<int> list ,int index1, int index2) {
  RangeError.checkValidIndex(index1, list, 'index1');
  RangeError.checkValidIndex(index2, list, 'index2');
  var tmp = list[index1];
  list[index1] = list[index2];
  list[index2] = tmp;
}