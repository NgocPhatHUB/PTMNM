@extends('master')
@section('content')
<style type="text/css">

.login-container .page-container {
  padding-top: 40px;
  position: static;
  border: 1px solid #ccc;
}
.login-container .page-container .login-form {
  width: 320px;
}
.login-container .page-container .login-form .thumb {
  margin: 0 auto 20px auto;
}
.login-container .page-container .login-form,
.login-container .page-container .registration-form {
  margin: 0 auto 20px auto;
}
@media (max-width: 480px) {
  .login-container .page-container .login-form,
  .login-container .page-container .registration-form {
    width: 100%;
  }
}
.login-container .page-container .nav-tabs.nav-justified {
  margin-bottom: 0;
}
.login-container .page-container .nav-tabs.nav-justified > li > a {
  border-top: 0!important;
  padding-left: 15px;
  padding-right: 15px;
  background-color: #f5f5f5;
}
.login-container .page-container .nav-tabs.nav-justified > li:first-child > a {
  border-left: 0;
  border-radius: 3px 0 0 0;
}
.login-container .page-container .nav-tabs.nav-justified > li:last-child > a {
  border-right: 0;
  border-radius: 0 3px 0 0;
}
.login-container .page-container .nav-tabs.nav-justified > li.active > a {
  background-color: transparent;
}
@media (max-width: 768px) {
  .login-container .page-container .nav-tabs.nav-justified {
    padding: 0;
    border-width: 0 0 1px 0;
    border-radius: 0;
  }
  .login-container .page-container .nav-tabs.nav-justified:before {
    content: none;
  }
  .login-container .page-container .nav-tabs.nav-justified > li > a {
    border-width: 0!important;
  }
}
.login-container .footer {
  left: 0;
  right: 0;
}
@media (max-width: 768px) {
  .login-options,
  .login-options .text-right {
    text-align: center;
  }
}
.icon-object {
  border-radius: 50%;
  text-align: center;
  margin: 10px;
  border-width: 3px;
  border-style: solid;
  padding: 20px;
  display: inline-block;
}
.icon-object > i {
  font-size: 32px;
  top: 0;
}
</style>
<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="http://127.0.0.1:8000/index">Home /&nbsp;</a></li>
				<li class="active"><a href="http://127.0.0.1:8000/dang-ky">ĐĂNG KÝ TÀI KHOẢN</a></li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->
<div class="login-container">
	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">

					<!-- Simple login form -->
					<form action="{{route('sigin')}}" method="post">
						<input type="hidden" name="_token" value="{{csrf_token()}}">
						<div class="panel panel-body login-form" style=" width: 400px;
    					margin: auto; margin-top: 48px; margin-bottom: 10px;">
							@if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $err)
							{{$err}} <br>
							@endforeach
						</div>
					@endif
					@if(Session::has('thanhcong'))
						<div class="alert alert-success">{{Session::get('thanhcong')}}</div>
					@endif
							<div class="text-center">
								<br><br><br>
								<h4 class="content-group" style ="color:black"><b>ĐĂNG KÝ TÀI KHOẢN</b></h4> 
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Họ và tên</label>
								<input type="text" name="fullname" class="form-control" placeholder="Nhập họ và tên">
								<div class="form-control-feedback">
									<i class="icon-user text-muted"></i>
								</div>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Số điện thoại</label>
								<input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại của bạn">
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Email</label>
								<input type="email" name="email" class="form-control" placeholder="Nhập email của bạn">
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Địa chỉ</label>
								<input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
							</div>


							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Mật khẩu</label>
								<input type="password" name="password" class="form-control" placeholder="Mật khẩu ít nhất 6 kí tự">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<label style="color:black;">Xác thực mật khẩu</label>
								<input type="password" name="re_password" class="form-control" placeholder="Nhập lại mật khẩu">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">Đăng ký<i class="icon-circle-right2 position-right"></i></button>
							</div>

							<div class="form-group" style ="text-align: center;">
            					<span style ="color:black;">Bạn đã có tài khoản?</span> 
								<a href="{{route('login')}}" class="btnRegis"><span>Đăng nhập ngay</span></a>
            				</div>

						</div>
					</form>
					<!-- /simple signup form -->


				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->
</div>
@endsection