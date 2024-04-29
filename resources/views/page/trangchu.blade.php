@extends('master')
@section('content')
 <section class="main_slider_area">
            <div id="main_slider" class="rev_slider" data-version="5.3.1.6">
                <ul>
                    <li data-index="rs-1587" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="source/assets/img/home-slider/slider-1.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="source/assets/img/home-slider/slider-1.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    </li>
                    <li data-index="rs-1588" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="source/assets/img/home-slider/slider-2.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="source/assets/img/home-slider/slider-8.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    <li data-index="rs-1588" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="source/assets/img/home-slider/slider-2.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="source/assets/img/home-slider/slider-3.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    <li data-index="rs-1588" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="source/assets/img/home-slider/slider-2.jpg"  data-rotate="0"  data-saveperformance="off"  data-title="Creative" data-param1="01" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                    <!-- MAIN IMAGE -->
                    <img src="source/assets/img/home-slider/slider-2.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg" data-no-retina>
                    <!-- LAYERS -->
                        
                </ul>
            </div>
        </section>
        <!--================End Slider Area =================-->
        
        <!--================Welcome Area =================-->
        <section class="welcome_bakery_area">
            <div class="container">
                <div class="welcome_bakery_inner p_100">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="main_title">
                                <h2>BÁNH NGỌT</h2>
                                <p>Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của nhà Atelier chúng mình.</p>
                            </div>
                            <div class="welcome_left_text">
                                <p> Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự tận tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.</p>
                                <a class="pink_btn" href="{{route('loaisanpham',36)}}">Khám phá ngay</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="welcome_img">
                                <img class="img-fluid" src="source/assets/img/cake-feature/welcome-right.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cake_feature_inner">
                    <div class="main_title">
                        <h2>Bánh nổi bật của chúng tôi</h2>
                        <h5> Lựa chọn và thưởng thức</h5>
                    </div>
                    <div class="cake_feature_slider owl-carousel">
                        @foreach($spnoibat as $spnb)
                        <div class="item">
                            <div class="cake_feature_item">
                                <div class="cake_img">
                                    <a href="{{route('chitietsanpham',$spnb->id)}}">
                                        <img src="source/assets/img/product/{{$spnb->image}}" alt="{{$spnb->name}}">
                                    </a>
                                </div>
                                <div class="cake_text">
                                    @if($spnb->promotion_price==0)
                                    <h4>{{number_format($spnb->unit_price)}} đ</h4>
                                    @else
                                    <h4>{{number_format($spnb->promotion_price)}} đ</h4>
                                    @endif
                                    <a href="{{route('chitietsanpham',$spnb->id)}}"><h3 style="white-space: nowrap;">{{$spnb->name}}</h3></a>
                                    <a class="pest_btn" href="{{route('themgiohang',$spnb->id)}}">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
        <!--================End Welcome Area =================-->
        
        <!--================Special Recipe Area =================-->
        <section class="special_recipe_area">
            <div class="container">
                <div class="special_recipe_slider owl-carousel">
                    @foreach($danhmuc as $dm)
                    <div class="item">
                        <div class="media">
                            <div class="d-flex">
                                <img src="source/assets/img/product/{{$dm->image}}" alt="">
                            </div>
                            <div class="media-body">
                                <h4>{{$dm->name}}</h4>
                                <p>{{$dm->description}}</p>
                                <a class="w_view_btn" href="{{route('loaisanpham',$dm->id)}}">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </section>
        <!--================End Special Recipe Area =================-->
        

        
        <!--================Discover Menu Area =================-->
        <section class="discover_menu_area">
            <div class="discover_menu_inner">
                <div class="container">
                    <div class="main_title">
                        <h2>Khám phá menu chúng tôi</h2>
                        <h5>Cùng thưởng thức các loại bánh ngọt có trong thực đơn</h5>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="discover_item_inner">
                                <?php $stt=1 ?>
                                @foreach($listmenu1 as $lm1)
                                <div class="discover_item">
                                    <h4>{{$lm1->name}}</h4>
                                    <p>{{$lm1->description}}<span> (<?php echo $stt++ ?>)</span></p>
                                </div>
                                @endforeach
                            </div>
                            <div class="discover_item_inner">
                                <?php $stt=7 ?>
                                @foreach($listmenu2 as $lm1)
                                <div class="discover_item">
                                    <h4>{{$lm1->name}}</h4>
                                    <p>{{$lm1->description}}<span>(<?php echo $stt++ ?>)</span></p>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Discover Menu Area =================-->
        
        
        <!--================Latest News Area =================-->
        <section class="latest_news_area p_100">
            <div class="container">
                <div class="main_title">
                    <h2>Blog mới nhất</h2>
                    <h5>Chia sẻ cách làm bánh ngọt </h5>
                </div>
                <div class="row latest_news_inner">
                    @foreach($blog as $bl)
                    <div class="col-lg-4 col-md-6">
                        <div class="l_news_item">
                            <div class="l_news_img">
                                <img class="img-fluid" src="source/assets/img/tintuc/{{$bl->image}}" alt="">
                            </div>
                            <div class="l_news_text">
                                <a href="{{route('chitiettin',$bl->id)}}"><h5>{{$bl->created_at}}</h5></a>
                                <a href="{{route('chitiettin',$bl->id)}}"><h4><?php echo $bl['title'] ?></h4></a>
                                <p><?php echo substr($bl['summary'],0,255) ?>...</p>
                            </div>
                        </div>
                    </div>
                
                    @endforeach
                </div>
            </div>
        </section>
        <!--================End Latest News Area =================-->
        
      
			
@endsection