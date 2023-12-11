class MainStrings {
  static const String mainTitle = "ELK Search Application";
  static const String reportBtnString = "Send Ip's to Backend";

  static const String searchOption1value = "pkSeqID";
  static const String searchOption2value = "proto";
  static const String searchOption3value = "saddr";
  static const String searchOption4value = "sport";
  static const String searchOption5value = "daddr";
  static const String searchOption6value = "dport";
  static const String searchOption7value = "category";
  static const String searchOption8value = "subcategory";
  static const String searchOption9value = "min";
  static const String searchOption10value = "mean";
  static const String searchOption11value = "max";

  static const String searchOption1 = "ID";
  static const String searchOption2 = "Protocol";
  static const String searchOption3 = "Source Address";
  static const String searchOption4 = "Source Port";
  static const String searchOption5 = "Destination Address";
  static const String searchOption6 = "Destination Port";
  static const String searchOption7 = "Category";
  static const String searchOption8 = "Sub Category";
  static const String searchOption9 = "Min";
  static const String searchOption10 = "Mean";
  static const String searchOption11 = "Max";
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
  static const String columnName1 = "Value";
  static const String columnName2 = "Count";
  static const String headerText = "Top 10 Values From Query";
  static const String tooltipText =
      "Count of values for the results of the performed query process based on the selected column.";
}

class SnackBarStrings {
  static const String success = "Search Successful!";
  static const String failed = "Something went wrong!";
  static const String loading = "Searching...";
  static const String empty = "No Result Found";
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

class ImageStrings {
  static const String splashImage = "assets/images/elasticsearch_logo.png";
}
