// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function (n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

//Ajax Block

const xmlhttps = new XMLHttpRequest();
// Bằng cách dùng servlet content type là json thì sẽ biến servlet đó 1 json -> load đc dữ liệu mới sẽ nhanh hơn là tạo 1 file json
// Do file ngoài sẽ load lâu hơn so với các file jsp và servlet
const json = 'http://localhost:8080/SWP_PROJECT/DriverChartTrip';
xmlhttps.open('GET', json, true); // để get json
xmlhttps.send();

// JS ko biết nhiều nên lên đây đọc đi "https://www.w3schools.com/xml/ajax_xmlhttprequest_response.asp" (～￣▽￣)～
xmlhttps.onreadystatechange = function ()
{
    if (this.readyState == 4 && this.status == 200) // lên đọc cái link đó (～￣▽￣)～
    {
        //responseText sẽ trả về 1 kiểu string khi lấy các giá trị trg file json
        // dùng JSON.parse để đổi qua json 
        const dataPoints = JSON.parse(this.responseText);
        console.log(dataPoints); // F12 or inspect để xem giá trị đã lấy ra từ json

        // Cái này là dùng cho tên của các cột biểu đồ
        const labelMonths = dataPoints.NumberTrip.map(
                function (index)
                {
                    return index.month;  // cái này cứ hiểu là lấy value của key có tên là "month" trong json
                });
        // Cái này là dữ liệu số chuyến trong tháng
        const numberTrip = dataPoints.NumberTrip.map(
                function (index)
                {
                    return index.trips; // cái này cứ hiểu là lấy value của key có tên là "tríps" trong json
                });
        console.log(numberTrip);


        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labelMonths, // đoạn này sẽ xóa đi và sửa lại thành labelMonths để hiện các tháng
                datasets: [{
                        label: "number trips received",
                        backgroundColor: "#4e73df",
                        hoverBackgroundColor: "#2e59d9",
                        borderColor: "#4e73df",
                        data: numberTrip, // data là dữ liệu trong biểu đồ thay thành các dữ liệu trong json
                    }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                            time: {
                                unit: 'month'
                            },
                            gridLines: {
                                display: false,
                                drawBorder: false
                            },
                            ticks: {
                                // cái này chỉnh lại thành 12 để hiện 12 tháng còn nếu để 7 thì sẽ hiện
                                // kiểu này => jan  mar  may  jul  sep  oct  dec
                                maxTicksLimit: 12 
                            },
                            maxBarThickness: 25,
                        }],
                    yAxes: [{
                            ticks: {
                               //min và maxTicksLimit là bên cột dữ liệu là tối đa là hàng chục
                                min: 0,
                                maxTicksLimit: 10,
                                padding: 10,
                                callback: function (value, index, values) {
                                    return number_format(value);
                                }
                            },
                            gridLines: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                                borderDash: [2],
                                zeroLineBorderDash: [2]
                            }
                        }],
                },
                legend: {
                    display: false
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function (tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                        }
                    }
                },
            }
        });
    }
};