	@extends('master')
	@section('content')
	        <!--================End Main Header Area =================-->
        <section class="banner_area">
        	<div class="container">
			@if(session('thongbao'))
	    		<div class="alert alert-success">
	    			{{session('thongbao')}}
	    		</div>
	    	@endif
        		<div class="banner_text">
        			<h3>Liên hệ</h3>
        			<ul>
        				<li><a href="index.html">Home</a></li>
        				<li><a href="single-blog.html">Liên hệ</a></li>
        			</ul>
        		</div>
        	</div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Contact Form Area =================-->
        <section class="contact_form_area p_100">
        	<div class="container">
        		<div class="main_title">
					<h2>>Mẫu liên hệ</h2>
					<h5>Mọi thắc mắc hoặc góp ý, quý khách vui lòng liên hệ trực tiếp với bộ phận chăm sóc khách hàng của chúng tôi bằng cách điền đầy đủ thông tin vào form bên dưới.</h5>
				</div>
       			<div class="row">
       				<div class="col-lg-7">
       					<form class="row contact_us_form" method="post" id="contactForm">
						   <input type="hidden" name="_token" value="{{csrf_token()}}">
							<div class="form-group col-md-6">
								<input type="text" class="form-control" id="name" name="name" placeholder="Tên bạn">
							</div>
							<div class="form-group col-md-6">
								<input type="email" class="form-control" id="email" name="email" placeholder="Email">
							</div>
							<div class="form-group col-md-12">
								<input type="number" class="form-control" id="subject" name="phone" placeholder="Số điện thoại">
							</div>
							<div class="form-group col-md-12">
								<textarea class="form-control" name="message" id="message" rows="1" placeholder="Nội dung"></textarea>
							</div>
							<div class="form-group col-md-12">
								<button type="submit" value="submit" class="btn order_s_btn form-control">Gửi</button>
							</div>
						</form>
       				</div>
       				<div class="col-lg-4 offset-md-1">
       					<div class="contact_details">
       						<div class="contact_d_item">
       							<h3>Địa chỉ :</h3>
       							<p>CN1: 244 Pasteur, phường 6, quận 3, TP.HCM
								<br>
								CN2: 18 Thảo Điền, phường Thảo Điền, TP. Thủ Đức, TP.HCM 
								</p>
       						</div>
       						<div class="contact_d_item">
       							<h5>Số điện thoại : <a href="tel:0905.666.888">0905.666.888 </a></h5>
       							<h5>Email : <a href="info@ateliercake.com">info@ateliercake.com</a></h5>
       						</div>
       						<div class="contact_d_item">
       							<h3>Giờ làm việc :</h3>
       							<p>8:00 AM – 20:00 PM</p>
       							<p>Monday – Saturday</p>
       						</div>
       					</div>
       				</div>
       			</div>
        	</div>
        </section>
        <!--================End Contact Form Area =================-->
        
        <!--================End Banner Area =================-->
        <section class="map_area">
		<div class="container-xxl py-6 px-0 wow fadeInUp" data-wow-delay="0.1s">
        <iframe class="w-100 mb-n2" style="height: 450px;"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.3334432613005!2d106.68549327696276!3d10.785753361938218!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3248f62ff7%3A0x226989336f1a501b!2zMjQ0IFBhc3RldXIsIFBoxrDhu51uZyA2LCBRdeG6rW4gMywgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaWV0bmFt!5e0!3m2!1sen!2sbd!4v1712492328435!5m2!1sen!2sbd"
         width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
        </section>
        <!--================End Banner Area =================-->
        
	@endsection