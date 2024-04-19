

class DateHelpers {
  static getstarData(){
    var _date = DateTime.now();
    return "${_date.toLocal().day}/${_date.toLocal().month}/${_date.toLocal().year}";
  }
}