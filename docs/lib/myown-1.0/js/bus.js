$.getJSON(
//  url="https://ptx.transportdata.tw/MOTC/v2/Bus/RealTimeByFrequency/Streaming/City/Taipei/916?$top=30&$format=JSON",
//  url="https://ptx.transportdata.tw/MOTC/v2/Bus/RealTimeNearStop/City/Taipei?$top=1&$format=JSON",
  url="https://ptx.transportdata.tw/MOTC/v2/Bus/EstimatedTimeOfArrival/Streaming/City/Taipei/916?$top=30&$format=JSON",
  success = function (data) {
    bus_data = data;
    console.log(bus_data);
  }
)
