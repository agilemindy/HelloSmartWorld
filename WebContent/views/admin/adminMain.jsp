<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HELLO SMART WORLD</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>


       
        <style type="text/css">
            *{box-sizing:board-box;}
            .video-film {box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px; z-index: 100;}
            .video-background {
                background: #000; position: fixed;
                top: 0; right: 0; bottom: 0; left: 0; z-index: -99;
            }
            .video-foreground, .video-background iframe {
                position: absolute; top: 0; left: 0;
                width: 100%; height: 100%; pointer-events: none;
            }
            @media ( min-aspect-ratio : 16/9) {
                .video-foreground {height: 300%; top: -100%;}
            }
            @media ( max-aspect-ratio : 16/9) {
                .video-foreground {width: 300%; left: -100%;}
            }
            h1 {color: white;}
            #visual-btn {
                z-index: 50; color: #fff; font-size: 20px; border: 2px solid #fff;
                padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
            }
            #visual-btn:hover {
                color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
                padding: 12px 24px; border-radius: 5px; cursor: pointer;
            }
            #indexBtn {position: fixed; text-align: center}
            .center {position: absolute; top: 60%; left: 47%; margin: -50px 0 0 -50px;}
        </style>


</head>
<body>
		<%@ include file = "adminMenubar.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">This changes everything.</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop</p>
                    <p class="lead">
                        <a onclick="goProduct();" class="btn btn-lg btn-secondary fw-bold border-black bg-black">Learn more</a>
                    </p>
					<script>							
							function goProduct(){
								location.href="<%= request.getContextPath()%>/productList.do";
							}			
					
					</script>
                </div>
            </div>
        </header>
        <!-- Section-->
        
        <section class="py-5">
            <div class="video-background">
                <div class="video-foreground">
                    <div id="muteYouTubeVideoPlayer"></div>
                </div>
            </div>
            
            <div class="video-film"></div>
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script  src="https://cdn.jsdelivr.net/jquery.typeit/4.4.0/typeit.min.js"></script>
            

            
        
           
            <script defer src="https://www.youtube.com/iframe_api"></script>
            <script type="text/javascript">
                var player;
                
                function onYouTubePlayerAPIReady(){
                    player = new YT.Player('muteYouTubeVideoPlayer', {
                        videoId : '2Jdpwb_0F5w',
                        playerVars : {
                            autoplay : 1, 		// Auto-play the video on load // 자동 재생 (유)
                            controls : 0, 		// Show pause/play buttons in player // 컨트롤러의 유무 (무)
                            rel : 0,			// 해당 영상이 종료된 후 관련 동영상 표시할지
                            start : 0,
                            end : 301,
                            showinfo : 0, 		// Hide the video title // 재생 영상에 대한 정보 유무
                            modestbranding : 1, // Hide the Youtube Logo
                            loop : 1, 			// Run the video in a loop // 반복 재생에 대한 여부
                            playlist : '2Jdpwb_0F5w',
                            fs : 0, 			// Hide the full screen button
                            cc_load_policy : 0, // Hide closed captions
                            iv_load_policy : 3, // Hide the Video Annotations
                            autohide : 1		// Hide video controls when playing
                        },
                        events:{
                            onReady:function(e){
                                e.target.mute();
                            }
                        }
                    });
                }
            </script>


           
        </section> 

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>