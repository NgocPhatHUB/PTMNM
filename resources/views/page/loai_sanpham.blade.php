@extends('master')
@section('content')
        <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>{{$loai_sp->name}}</h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="shop.html">{{$loai_sp->name}}</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Product Area =================-->
        <section class="product_area p_100">
            <div class="container">
                <div class="row product_inner_row">
                    <div class="col-lg-9">
                       <!--  <div class="row m0 product_task_bar"> 
                            <div class="product_task_inner"> 
                                <div class="float-left">
                                    <a class="active" href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a>
                                    <span>Showing 1 - 10 of 55 results</span>
                                </div>
                               
                            </div>
                        </div> -->
                        <div class="row product_item_inner">
                            @foreach($sp_loai as $spl)
                            <div class="col-lg-4 col-md-4 col-6">
                                <div class="cake_feature_item">
                                    <div class="cake_img">
                                        <a href="{{route('chitietsanpham',$spl->id)}}">
                                            <img src="source/assets/img/product/{{$spl->image}}" style="max-height: 200px;" alt="">
                                        </a>
                                    </div>
                                    <div class="cake_text">
                                        <h4>
                                             @if($spl->promotion_price==0)
                                                {{number_format($spl->unit_price)}} đ
                                                @else
                                             {{number_format($spl->promotion_price)}} đ
                                            @endif
                                        </h4>
                                        <a href="{{route('chitietsanpham',$spl->id)}}">
                                            <h3 style="white-space: nowrap;">{{$spl->name}}</h3>
                                        </a>
                                        <a class="pest_btn" href="{{route('themgiohang',$spl->id)}}">Thêm vào giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                        <div class="paginatoin-area">
                            <div class="row">
                                <div class="col-lg-12 col-md-6">   
                                       <div>{{$sp_loai->links()}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product_left_sidebar">
                            <form action="{{route('search')}}" method="get" class="hm-searchbox">
                                <aside class="left_sidebar search_widget">
                                    <div class="input-group">
                                        <input type="text" name="key" class="form-control" placeholder="Nhập từ khóa tìm kiếm">
                                        <div class="input-group-append">
                                            <button class="btn" type="submit"><i class="icon icon-Search"></i></button>
                                        </div>
                                    </div>
                                </aside>
                            </form>
                            <aside class="left_sidebar p_catgories_widget">
                                <div class="p_w_title">
                                    <h3>Danh mục sản phẩm</h3>
                                </div>
                                <ul class="list_style">
                                    @foreach($loai as $l)
                                  
                                        <li><a href="{{route('loaisanpham',$l->id)}}">{{$l->name}}</a></li>
                               
                                    @endforeach
                                </ul>
                            </aside>
                    <!--         <aside class="left_sidebar p_price_widget">
                                <div class="p_w_title">
                                    <h3>Filter By Price</h3>
                                </div>
                                <div class="filter_price">
                                    <div id="slider-range"></div>
                                    <label for="amount">Price range:</label>
                                    <input type="text" id="amount" readonly />
                                    <a href="#">Filter</a>
                                </div>
                            </aside> -->
                            <aside class="left_sidebar p_sale_widget">
                                <div class="p_w_title">
                                    <h3>Sản phẩm mới</h3>
                                </div>
                                @foreach($sp_moi as $spk)
                                <div class="media">
                                    <div class="d-flex">
                                        <img src="source/assets/img/product/{{$spk->image}}" alt="{{$spk->name}}" width="105px" height="95px">
                                    </div>
                                    <div class="media-body">
                                        <a href="{{route('chitietsanpham',$spk->id)}}"><h4 style="white-space: nowrap;"><?php echo substr($spk['name'],0,15) ?>...</h4></a>
                                        <ul class="list_style">
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o"></i></a></li>
                                        </ul>
                                        <h5>
                                            @if($spk->promotion_price==0)
                                                {{number_format($spk->unit_price)}} đ
                                                @else
                                             {{number_format($spk->promotion_price)}} đ
                                            @endif
                                        </h5>
                                    </div>
                                </div>
                                @endforeach
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Product Area =================-->
        
@endsection