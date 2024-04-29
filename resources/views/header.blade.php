
 <!--================Main Header Area =================-->
        <header class="main_header_area">
            <div class="top_header_area row m0">
                <div class="container">
                    <div class="float-left">
                    <a href="#"><i class="fa fa-phone" aria-hidden="true"></i>0905.666.888</a>
                        <a href="mainto:info@ateliercake.com"><i class="fa fa-envelope-o" aria-hidden="true"></i> info@ateliercake.com</a>
                    </div>
                    <div class="float-right">
                        <ul class="h_social list_style">
                            <li>
                                @if(Auth::check())
                                <a  class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" href="#"><i class="fa fa-user"></i> &nbsp;{{Auth::user()->full_name}}</a>
                                    @if(Auth::check())
                                        @if(Auth::user()->level==1)
                                        <ul class="dropdown-menu sub-menu-3" style="background: #054000">
                                            <li class="dropdown submenu menu-3" style="display: block;margin-right: 0px;"><a class="dropdown-toggle" href="{{route('trangchu')}}" style="display: block; background: #054000;padding-left: 15px;">Admin</a></li>
                                            <li class="dropdown submenu menu-3" style="display: block;"><a class="dropdown-toggle" href="{{route('logout')}}" style="display: block;background: #054000;padding-left: 15px;">Đăng xuất</a></li>
                                        </ul>
                                        @else
                                        <ul class="dropdown-menu sub-menu-3" style="background: #054000">
                                            <li class="dropdown submenu menu-3" style="display: block;"><a href="{{route('logout')}}" style="display: block;background: #054000;padding-left: 15px;">Đăng xuất</a></li>
                                        </ul>
                                        @endif
                                    @endif
                                @else
                                    <a href="{{route('login')}}" class="text-uppercase" style="font-size: 12px;">Đăng Nhập</a> / <a href="{{route('sigin')}}" class="text-uppercase">Đăng Ký</a>
                                @endif
                            </li>
                        </ul>
                        <ul class="h_search list_style">
                            <li class="shop_cart"><a href="{{route('giohang')}}" style=" right: 30px;top: 16px;"><i class="lnr lnr-cart"></i> <span style="right: -10px;top: -10px;"> @if(Session::has('cart'))
                                            {{Session('cart')->totalQty}}
                                        @else 0
                                        @endif </span></a></li>
                            <li><a class="popup-with-zoom-anim" href="#test-search"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main_menu_area">
                <div class="container">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="index.html">
                        <img src="source/assets/img/logo.png" alt="">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="my_toggle_menu">
                                <span></span>
                                <span></span>
                                <span></span>
                            </span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li>
                                    <a href="{{route('trang-chu')}}">Trang chủ</a>
                                </li>
                                <li class="dropdown submenu">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Danh mục sản phẩm</a>
                                    <ul class="dropdown-menu">
                                        @foreach($loai_sp as $lsp)
                                        <li class="dropdown submenu menu-2">
                                            <a class="dropdown-toggle" href="{{route('loaisanpham',$lsp->id)}}">{{$lsp->name}}</a>
                                            <ul class="sub-menu-3">
                                                @foreach($lsp->category as $dm)
                                                    <li class="dropdown submenu menu-3">
                                                        <a class="dropdown-toggle" href="{{route('danhmucsp',$dm->id)}}">{{$dm->name}}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav justify-content-end">
                                <li class="dropdown submenu">
                                    <a href="{{route('tintuc')}}" >Blog</a>
                                </li>
                                <li><a href="{{route('gioithieu')}}">Giới thiệu</a></li>
                                <li><a href="{{route('lienhe')}}">Liên hệ</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!--================End Main Header Area =================-->
        <style type="text/css">
           .dropdown.submenu.menu-2{
              position: relative;
            }
            .sub-menu-3{
              position: absolute;
              top: 0;
              right: -100%;
              display: none;
              padding: 0;
              width: 250px;
            }
             .sub-menu-3 li{
                display: block;
             }
            .dropdown-menu .menu-2:hover .sub-menu-3{
              display: block;
            }
            .sub-menu-3 a{
                background: #fff;
                color: #000;
                white-space: nowrap;
            }
            .sub-menu-3 .menu-3:hover a{
                background: #fff!important;
                color: #000 !important;
                border: 1px solid #f195b2;
                border-bottom: 1px solid #f195b2 !important;
            }
            .top_header_area .float-right .h_search li.shop_cart a span{
              height: 18px;
              width: 18px;
              font-size: 11px;
              text-align: center;
              border-radius: 50%;
              background: #fff;
              color: #242424;
              font-family: "Montserrat", sans-serif;
              font-weight: bold;
              display: inline-block;
              line-height: 18px;
              position: absolute;
              right: -8px;
              top: 5px;
            }

        </style>