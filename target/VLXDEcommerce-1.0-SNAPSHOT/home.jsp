<%-- 
    Document   : home.jsp
    Created on : 13 Mar 2022, 1:42:50 am
    Author     : hungt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vật Liệu Xây Dựng</title>
        <!-- UIkit CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/css/uikit.min.css" />
        <link rel="stylesheet" href="./css/styles.css"/>
        <!-- UIkit JS -->
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.11.1/dist/js/uikit-icons.min.js"></script>
    </head>
    <body>
        <jsp:include page="menubar.jsp">
            <jsp:param name="cartLength" value="${cartLength}"/>
        </jsp:include>

        <section class="hero-slider">

            <div class="uk-inline uk-width-1-1">
                <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow="animation: pull; autoplay: true; autoplay-interval: 5000; pause-on-hover: false">

                    <div>
                        <ul class="uk-slideshow-items" uk-height-viewport="offset-bottom: 25; min-heigh: 50; offset-top: true">
                            <li>
                                <img src="https://images.unsplash.com/photo-1589939705384-5185137a7f0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" alt="" uk-cover>

                            </li>
                            <li>
                                <img src="https://images.unsplash.com/photo-1565008447742-97f6f38c985c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80" alt="" uk-cover>
                            </li>
                            <li>
                                <img src="https://images.unsplash.com/photo-1504307651254-35680f356dfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80" alt="" uk-cover>
                            </li>
                            <li>
                                <<img src="https://images.unsplash.com/photo-1587052694737-a972e4186288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80" alt="alt"/>
                            </li>
                        </ul>

                        <a class="uk-position-center-left uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-slidenav-large uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>

                        <div class="uk-position-bottom-center uk-position-small">
                            <ul class="uk-slideshow-nav uk-dotnav uk-flex-center uk-margin uk-light"></ul> 
                            <!--                                <li uk-slideshow-item="0"><a href="#">Item 1</a></li>
                                                            <li uk-slideshow-item="1"><a href="#">Item 2</a></li>
                                                            <li uk-slideshow-item="2"><a href="#">Item 3</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="uk-margin-large-left uk-padding-large uk-position-large uk-position-center-left uk-width-2-3">
                    <div class="overlay-info uk-width-2xlarge uk-padding-large uk-light uk-animation-slide-top-medium">
                        <h1><span uk-icon="icon: uikit; ratio: 5"></span> HighBrick Corporation</h1>
                        <h4>The world's leading in construction facilities and materials</h4>
                        <p>We are in part of <strong>Shanghai</strong>, <strong>Melbourne</strong>, <strong>Berlin</strong>, and <strong>Vietnam</strong><p>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="product-list.jsp">
            <jsp:param name="products" value=""/>
        </jsp:include>

        <section>
            <div>
                <div class="uk-panel uk-padding bg-red">
                    <div class="uk-width-1-1">
                        <span uk-icon="icon: album; ratio: 2.5" class="fg-white uk-float-left uk-margin-large-left"></span>
                        <h1 class="fg-white uk-float-right uk-margin-remove-vertical uk-margin-large-right">We are on the market's top</h1>
                    </div>
                </div>
            </div>
            <div class="uk-section uk-width-1-1 uk-flex uk-padding-remove">
                <!-- TradingView Widget BEGIN -->
                <div class="uk-padding uk-width-1-2">
                    <div class="tradingview-widget-container uk-animation-fade uk-border-rounded uk-box-shadow-large">
                        <div id="tradingview_57129 uk-width-1-1 uk-box-shadow-large"></div>
                        <div class="tradingview-widget-copyright uk-width-1-1">
                            <a href="https://www.tradingview.com/symbols/AMEX-VYM/" rel="noopener" target="_blank">
                                <span class="blue-text">VYM Chart</span>
                            </a> by TradingView
                        </div>
                        <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                        <script type="text/javascript">
                            new TradingView.widget({
                                "width": 600,
                                "height": 400,
                                "symbol": "AMEX:VYM",
                                "interval": "W",
                                "timezone": "Etc/UTC",
                                "theme": "light",
                                "style": "1",
                                "locale": "en",
                                "toolbar_bg": "#f1f3f6",
                                "enable_publishing": false,
                                "hide_top_toolbar": true,
                                "container_id": "tradingview_57129"
                            });
                        </script>
                    </div>
                </div>
                <div id="explainer" class="uk-width-1-2" style="
                        background-image: url(https://images.unsplash.com/photo-1486175060817-5663aacc6655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80);
                        background-position: bottom;
                        background-size: cover;
                        background-repeat: no-repeat;
                        filter: grayscale(0.75) hue-rotate(160deg);
                     ">
                    <div class="uk-position-cover uk-position-large uk-padding-large" style="
                            background: #fffa;
                            backdrop-filter: blur(25px);
                         ">
                        <h2>Do you want to know about <br> <strong>what makes us become <br>the most-trusted corportation<br> in construction" ?</strong></h2>
                        
                    </div>
                </div>
            </div>

            <!-- TradingView Widget END -->
        </section>

    </body>
</html>
