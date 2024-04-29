 @extends('master')
@section('content')
 <!--================End Main Header Area =================-->
        <section class="banner_area">
        	<div class="container">
        		<div class="banner_text">
        			<h3>Blog</h3>
        			<ul>
        				<li><a href="{{route('trang-chu')}}">Home</a></li>
        				<li><a href="blog.html">Blog</a></li>
        			</ul>
        		</div>
        	</div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Blog Main Area =================-->
        <section class="main_blog_area p_100">
        	<div class="container">
        		<div class="blog_area_inner">
					<div class="main_blog_column row">
						@foreach($tintuc as $news)
						<div class="col-lg-6">
							<div class="blog_item">
								<div class="blog_img" style="height: 360px; border: 1px solid #ccc;">
									<img class="img-fluid" src="/source/assets/img/tintuc/{{$news->image}}" width="100%" height="100%"  alt="">
								</div>
								<div class="blog_text">
									<div class="blog_time">
										<div class="float-left">
											<a href="{{route('chitiettin',$news->id)}}">{{$news->created_at}}</a>
										</div>
										<div class="float-right">
											<ul class="list_style">
												<li><a href="#">By :  Admin</a></li>
												<!-- <li><a href="#">bekery, sweet</a></li>
												<li><a href="#">Comments: 8</a></li> -->
											</ul>
										</div>
									</div>
									<a href="{{route('chitiettin',$news->id)}}"><h4><?php echo $news['title'] ?></h4></a>
									<p><?php echo substr($news['summary'],0,350)?>...</p>
									<a class="pink_more" href="{{route('chitiettin',$news->id)}}">Xem chi tiết</a>
								</div>
							</div>
						</div>
						@endforeach
					</div>
					  <div class="paginatoin-area">
                            <div class="row">
                                <div class="col-lg-12 col-md-6">   
                                       <div>{{$tintuc->links()}}</div>
                                </div>
                            </div>
                        </div>
        		</div>
        	</div>
        </section>
        <!--================End Blog Main Area =================-->
@endsection