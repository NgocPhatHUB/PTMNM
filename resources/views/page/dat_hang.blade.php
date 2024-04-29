@extends('master')
	@section('content')
       <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>Chekout</h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="checkout.html">Chekout</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Billing Details Area =================-->    
        <section class="billing_details_area p_100">
            <div class="container">
                <div class="return_option">
                      @if(!Auth::check())
                    <h4>Phản hồi khách hàng <a href="{{route('login')}}">nhấn đây để đăng nhập</a></h4>
                    @endif
                </div>
                <div class="row">
                     <form class="billing_form row" action="{{route('dathang')}}" method="post" >
                    @if(Session::has('thongbao'))
                      <div class="alert alert-info col-lg-12"><h2>{{Session::get('thongbao')}}<h2></div>
                    @endif
                    <div class="col-lg-7">
                        <div class="main_title">
                            <h2>Chi tiết thanh toán</h2>
                        </div>
                        <div class="billing_form_area">
                            <div class="row">                           
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <div class="form-group col-md-6">
                                    <label for="first">Họ và tên *</label>
                                    <input type="text" class="form-control" name="name" placeholder="Full name" required="required"
                                    @if(Auth::check())
                                    value="{{Auth::user()->full_name}}"
                                    @endif>
                                </div>
                                <div class="col-md-6 form-group">
                                    <div class="checkout-form-list">
                                        <label>Giới tính</label>
                                        <input id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 5%"><span style="margin-right: 5%">Nam</span>
                                        <input id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 5%"><span>Nữ</span>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="address">Địa chỉ *</label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Street Address" required="required"
                                    @if(Auth::check())
                                        value="{{Auth::user()->address}}"
                                    @endif>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Địa chỉ Email *</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required="required"
                                    @if(Auth::check())
                                    value="{{Auth::user()->email}}"
                                    @endif>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone">Số điện thoại *</label>
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Select an option" required="required"
                                    @if(Auth::check())
                                    value="{{Auth::user()->phone}}"
                                    @endif>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="phone">Ghi chú</label>
                                    <textarea class="form-control" name="notes" id="message" rows="1" placeholder="Note about your order. e.g. special note for delivery"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="order_box_price">
                            <div class="main_title">
                                <h2>Đơn hàng của bạn</h2>
                            </div>
                            <div class="payment_list">
                                <div class="price_single_cost">
                                    <h5>Sản phẩm <span>Total</span></h5>
                                    @if(Session::has('cart'))
                                        @foreach($product_cart as $cart)
                                            <h5><?php echo substr($cart['item']['name'],0,30)?>... x {{$cart['qty']}} <span>{{number_format($cart['price'])}} VND</span></h5>
                                        @endforeach
                                    @endif
                                    <h4>Tổng số phụ <span>@if(Session::has('cart')){{number_format($totalPrice)}}@else 0 @endif VND</span></h4>
                                    <h5>Shipping<span class="text_f">Free Shipping</span></h5>
                                    <h3>Tổng tiền<span>@if(Session::has('cart')){{number_format($totalPrice)}}@else 0 @endif VND</span></h3>
                                </div>
                                <div id="accordion" class="accordion_area">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                               <input type="radio" name="payment_method" id="payments-1" checked value="COD" style="width: auto;height: auto;">
                                                <a class="" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                  Thanh Toán Khi Nhận Hàng
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                            <div class="card-body">
                                           Cửa hàng sẽ gửi đến địa chỉ của bạn, bạn vui lòng xem hàng rồi thanh toán tiền cho nhân viên giao hàng.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                               <input type="radio" name="payment_method" id="payments-2" value="ATM" style="width: auto;height: auto;">
                                                <a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                  Chuyển Khoản
                                                </a>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                            <div class="card-body">
                                            <p>Chuyển tiền đến số tài khoản sau:
                                            <br>-Số tài khoản: 123 456 789
                                            <br>-Chủ TK: NGUYEN VAN A
                                            <br>-Ngân Hàng Vietinbank, chi nhánh Mỹ Hào - Hưng Yên.
                                            <p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" value="submit" class="btn btn-primary">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </section>
        <!--================End Billing Details Area =================-->   
        
      <style type="text/css">
          .form-group .form-control{
            color: #000!important;
          }
      </style>
	@endsection