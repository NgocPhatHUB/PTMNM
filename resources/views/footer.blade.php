    <!--================Newsletter Area =================-->
        <section class="newsletter_area">
            <div class="container">
                <div class="row newsletter_inner">
                    <div class="col-lg-6">
                        <div class="news_left_text">
                            <h4>Đăng ký nhận thông báo để có thêm các thông tin hay từ chúng tôi</h4>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="newsletter_form">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nhập email của bạn">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button">Đăng ký ngay</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
  <!--================Footer Area =================-->
        <footer class="footer_area">
            <div class="footer_widgets">
                <div class="container">
                    <div class="row footer_wd_inner">
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_about_widget">
                                <img src="source/assets/img/footer-logo.png" alt="">
                                <p>Thế giới bánh ngọt dành cho bạn. Lựa chọn thông minh dành cho bạn</p>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_link_widget">
                                <div class="f_title">
                                    <h3>Đường dẫn nhanh</h3>
                                </div>
                                <ul class="list_style">
                                    <li><a href="{{route('trangchu')}}">Tài khoản của bạn</a></li>
                                    <li><a href="{{route('giohang')}}">Xem đơn hàng</a></li>
                                    <li><a href="">Chính sách bảo mật</a></li>
                                    <li><a href="">Điều khoản và điều kiện</a></li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_link_widget">
                                <div class="f_title">
                                    <h3>Thời gian làm việc</h3>
                                </div>
                                <ul class="list_style">
                                    <li><a href="time">Mon. - Fri. : 8 am - 8 pm</a></li>
                                    <li><a href="time">Sat. : 9am - 4pm</a></li>
                                    <li><a href="time">Sun. : Closed</a></li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_contact_widget">
                                <div class="f_title">
                                    <h3>Thông tin liên lạc</h3>
                                </div>
                                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>CN1: 244 Pasteur, phường 6, quận 3, TP.HCM</p>
                                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>CN2: 18 Thảo Điền, phường Thảo Điền, TP. Thủ Đức, TP.HCM</p>
                                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>0905.666.888</p>
                                <p class="mb-2"><i class="fa fa-envelope me-3"></i>   Atelier.cake@gmail.com</p>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--================Search Box Area =================-->
        <div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
             <form action="{{route('search')}}" method="get" class="hm-searchbox">
                <div class="search_box_inner">
                    <h3>Search</h3>
                    <div class="input-group">
                        <input type="text" class="form-control" name="key" placeholder="Tìm kiếm...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="icon icon-Search"></i></button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <!--================End Search Box Area =================-->
        <!--================End Footer Area =================-->