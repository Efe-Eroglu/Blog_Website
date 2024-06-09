<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="BlogProjem.admin.anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }
        .chart {
            flex: 1 1 45%;
            max-width: 45%;
            margin: 10px;
        }
        .chart.doughnut {
            flex: 1 1 30%;
            max-width: 30%;
        }
        canvas {
            width: 100% !important;
            height: auto !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="welcome-container">
        <div class="chart-container">
            <div class="chart">
                <canvas id="yorumChart"></canvas>
            </div>
            <div class="chart">
                <canvas id="kullaniciChart"></canvas>
            </div>
            <div class="chart doughnut">
                <canvas id="blogChart"></canvas>
            </div>
            <div class="chart doughnut">
                <canvas id="kategoriChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            var ctxYorum = document.getElementById('yorumChart').getContext('2d');
            var yorumChart = new Chart(ctxYorum, {
                type: 'bar',
                data: {
                    labels: ['Yorum Sayısı'],
                    datasets: [{
                        label: 'Yorumlar',
                        data: [yorumCount],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            var ctxKullanici = document.getElementById('kullaniciChart').getContext('2d');
            var kullaniciChart = new Chart(ctxKullanici, {
                type: 'bar',
                data: {
                    labels: ['Kullanıcı Sayısı'],
                    datasets: [{
                        label: 'Kullanıcılar',
                        data: [kullaniciCount],
                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                        borderColor: 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            var ctxBlog = document.getElementById('blogChart').getContext('2d');
            var blogChart = new Chart(ctxBlog, {
                type: 'doughnut',
                data: {
                    labels: ['Blog Sayısı'],
                    datasets: [{
                        label: 'Bloglar',
                        data: [blogCount],
                        backgroundColor: ['rgba(255, 159, 64, 0.2)'],
                        borderColor: ['rgba(255, 159, 64, 1)'],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                boxWidth: 20,
                                padding: 15
                            }
                        }
                    }
                }
            });

            var ctxKategori = document.getElementById('kategoriChart').getContext('2d');
            var kategoriChart = new Chart(ctxKategori, {
                type: 'pie',
                data: {
                    labels: kategoriAdlari,
                    datasets: [{
                        label: 'Kategoriler',
                        data: blogSayilari,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                boxWidth: 20,
                                padding: 15
                            }
                        }
                    }
                }
            });
        };
    </script>
</asp:Content>
