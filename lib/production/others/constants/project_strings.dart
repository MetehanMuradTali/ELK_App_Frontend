class MainStrings {
  static const String mainTitle = "ELK Search Application";
  static const String reportBtnString = "Send Ip's to Backend";

  static const String searchOption1value = "";
  static const String searchOption2value = "pkSeqID";
  static const String searchOption3value = "proto";
  static const String searchOption4value = "saddr";
  static const String searchOption5value = "sport";
  static const String searchOption6value = "daddr";
  static const String searchOption7value = "dport";
  static const String searchOption8value = "category";
  static const String searchOption9value = "subcategory";
  static const String searchOption10value = "min";
  static const String searchOption11value = "mean";
  static const String searchOption12value = "max";

  static const String searchOption1 = "All";
  static const String searchOption2 = "ID";
  static const String searchOption3 = "Protocol";
  static const String searchOption4 = "Source Address";
  static const String searchOption5 = "Source Port";
  static const String searchOption6 = "Destination Address";
  static const String searchOption7 = "Destination Port";
  static const String searchOption8 = "Category";
  static const String searchOption9 = "Sub Category";
  static const String searchOption10 = "Min";
  static const String searchOption11 = "Mean";
  static const String searchOption12 = "Max";
}

class FormWidgetStrings {
  static const String textFieldHint = "Query Value";
  static const String searchBtnTxt = "Search";
}

class SearchWidgetStrings {
  static const String nextPageBtnText = "Next ";
  static const String prevPageBtnText = "Previous";
}

class SortWidgetStrings {
  static const String columnName1 = "Source Address";
  static const String columnName2 = "Destionation Address";
  static const String columnName3 = "Count";
  static const String columnName4 = "Value";

  static const String headerText = "Top 10 Values From Query";
  static const String tooltipText =
      "Count of values for the results of the performed query process based on the selected column.";
}

class SnackBarStrings {
  static const String success = "Search Successful!";
  static const String failed = "Something went wrong!";
  static const String loading = "Searching...";
  static const String empty = "No Result Found";
  static const String ipSuccess = "Ips sent successfully!";
  static const String ipFailed = "Failed";
  static const String ipLoading = "Sending...";
  static const String ipEmpty = "Textfields can't be empty!!!";
}

class ReportWidgetStrings {
  static const String reportOptionDefault = "Normal";
  static const String ddOption1value = "DDoS";
  static const String ddOption2value = "DoS";
  static const String ddOption3value = "Reconnaissance";
  static const String ddOption4value = "Normal";
  static const String ddOption5value = "Theft";
  static const String headerText = "Top 10 Ip's From Query Based on Category";
  static const String tooltipText =
      "Count of values for the IP addresses in the results of the performed query process based on the selected category.";
}

class CountWidgetStrings {
  static const String totalCount = "TotalResultCount";
}

class Last1HourWidgetStrings {
  static const String headerText = "Top 10 Last 1 Hour Ip's By Category";
  static const String tooltipText =
      "Count of IP addresses for incoming requests in the last 1 hour based on categories.";
}

class Latest1HourWidgetStrings {
  static const String headerText = "Top 10 Latest 1 Hour Ip's By Category";
  static const String tooltipText =
      "Count of IP addresses for the requests within the last 1 hour of the latest incoming requests based on categories";
}

class IpStatusWidgetStrings {
  static const String columnName1 = "Source Address";
  static const String columnName2 = "Destination Address";
  static const String columnName3 = "Current State";
  static const String headerText = "Ip Status";
  static const String tooltipText = "Tooltip";
}

class ImageStrings {
  static const String splashImage = "assets/images/elasticsearch_logo.png";
}

class StatusStrings {
  ///SearchTableWidgetValues
  static const String searchTableColumn1 = "Source Address";
  static const String searchTableColumn2 = "Destination Address";
  static const String searchTableColumn3 = "Status";
  static const String searchTableColumn1value = "saddr";
  static const String searchTableColumn2value = "daddr";
  static const String searchTableColumn3value = "status";

  ///DropDownWidgetValues
  static const String searchDDOption1value = "";
  static const String searchDDOption2value = "Normal";
  static const String searchDDOption3value = "Limit";
  static const String searchDDOption4value = "Block";
  static const String searchDDOption1 = "All";
  static const String searchDDOption2 = "Normal";
  static const String searchDDOption3 = "Limit";
  static const String searchDDOption4 = "Block";

  ///FormWidgetValues
  static const String textFieldHint1 = "Source Adress";
  static const String textFieldHint2 = "Destination Adress";
}
