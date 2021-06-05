//$(function() {
        //setTimeout(function() {
        //update_bus_data('916', '15')
        //}, 100000);
        //});

        $(function() {
            setInterval(function() {
                update_bus_data('916', '15');
                //update_bus_data('932', '86');
                //update_bus_data('941', '1');
                //update_bus_data('939', '11');

            }, 10000);

        });

function update_bus_data(busNumber, stopnumber) {
    $.ajax({
        type: 'GET',
        url: 'https://ptx.transportdata.tw/MOTC/v2/Bus/EstimatedTimeOfArrival/City/NewTaipei/' + busNumber + '?$format=JSON',
        dataType: 'json',
        headers: GetAuthorizationHeader(),
        success: function(Data) {
            bus_data = Data;
            direct = bus_data[stopnumber]["Direction"];
            start = bus_data[stopnumber]["StopStatus"];
            console.log(bus_data[stopnumber]["EstimateTime"]);


            if (busNumber == '939') {
                arrivetime = parseInt(bus_data[stopnumber]["EstimateTime"]) + 120
            } else {
                arrivetime = bus_data[stopnumber]["EstimateTime"]
            };


            //console.log(bus_data)
        }
    })
}


function GetAuthorizationHeader() {
                var AppID = 'dbd38d180a7242289c973cd964e9ac77';
                var AppKey = 'AFjVp5I0XeCgDPjSCmkAsOxo6zE';

                var GMTString = new Date().toGMTString();
                var ShaObj = new jsSHA('SHA-1', 'TEXT');
                ShaObj.setHMACKey(AppKey, 'TEXT');
                ShaObj.update('x-date: ' + GMTString);
                var HMAC = ShaObj.getHMAC('B64');
                var Authorization = 'hmac username=\"' + AppID + '\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"' + HMAC + '\"';

                return {
                    'Authorization': Authorization,
                    'X-Date': GMTString /*,'Accept-Encoding': 'gzip'*/
                }; //如果要將js運行在伺服器，可額外加入 'Accept-Encoding': 'gzip'，要求壓縮以減少網路傳輸資料量
            }

function download(content, fileName, contentType) {
                var a = document.createElement("a");
                var file = new Blob([content], {
                    type: contentType
                });
                a.href = URL.createObjectURL(file);
                a.download = fileName;
                a.click();
            }






            if (direct == 0 && start == 0 || start == 1) {

                if (parseInt(arrivetime) <= 300) {
                    $('#route' + busNumber + '-1').addClass("less5mins").removeClass("between5and10 more10mins")
                    $('#route' + busNumber + '-2').addClass("btn-floating pulse red").removeClass("between5and10 more10mins")
                } else if (300 < parseInt(arrivetime) && parseInt(arrivetime) <= 600) {
                    $('#route' + busNumber + '-1').addClass("between5and10").removeClass("less5mins more10mins")
                    $('#route' + busNumber + '-2').addClass("between5and10").removeClass("btn-floating pulse red more10mins")

                } else {
                    $('#route' + busNumber + '-1').addClass("more10mins").removeClass("between5and10 less5mins")
                    $('#route' + busNumber + '-2').addClass("more10mins").removeClass("btn-floating pulse red between5and10")


                }
            } else {
                $('#route' + busNumber + '-1').hide()
                $('#route' + busNumber + '-2').hide()
            }






        }