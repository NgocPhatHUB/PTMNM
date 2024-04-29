@extends('master')
@section('content')
        <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>Kết quả tìm kiếm</h3>
                    <ul>
                        <li><a href="index">Home</a></li>
                        <li><a href="search">KẾT QUẢ TÌM KIẾM</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Product Area =================-->
        <section class="product_area p_100">
            <div class="container">
                <div class="row product_inner_row">
                    <div class="col-lg-12">
                        <div class="row m0 product_task_bar"> 
                            <div class="product_task_inner"> 
                                <div class="float-left">
                                    <a class="active" href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a>
                                    <span>Showing 1 - 10 of 55 results</span>
                                </div>
                               
                            </div>
                        </div>
                        <div class="row product_item_inner">
                            @foreach($product as $spl)
                            <div class="col-lg-3 col-md-3 col-6">
                                <div class="cake_feature_item">
                                    <div class="cake_img">
                                        <a href="{{route('chitietsanpham',$spl->id)}}">
                                            <img src="images/product/{{$spl->image}}" alt="">
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
                                       <div>{{$product->links()}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Product Area =================-->
        
@endsection