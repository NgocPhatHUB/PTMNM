@extends('master')
@section('content')
        <!--================End Main Header Area =================-->
        <section class="banner_area">
        	<div class="container">
        		<div class="banner_text">
        			<h3>Cart</h3>
        			<ul>
        				<li><a href="index.html">Home</a></li>
        				<li><a href="cart.html">Cart</a></li>
        			</ul>
        		</div>
        	</div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Cart Table Area =================-->
        <section class="cart_table_area p_100">
        	<div class="container">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th scope="col" style="text-align: center;">Ảnh sản phẩm</th>
								<th scope="col" style="text-align: center;">Tên sản phẩm</th>
								<th scope="col" style="text-align: center;">Đơn giá</th>
								<th scope="col" style="text-align: center;">Số lượng</th>
								<th scope="col" style="text-align: center;">Tổng tiền</th>
								<!-- <th scope="col">Cập nhật</th> -->
								<th scope="col" style="text-align: center;">Xóa</th>
							</tr>
						</thead>
						<tbody>
							@if(Session::has('cart'))
								@foreach($product_cart as $product)
								<tr>
									<td>
										<img src="source/assets/img/product/{{$product['item']['image']}}" alt="" width="150px" height="150px">
									</td>
									<td>{{$product['item']['name']}}</td>
									<td>
										@if($product['item']['promotion_price']==0)
											{{number_format($product['item']['unit_price'])}}
										@else {{number_format($product['item']['promotion_price'])}}
										@endif
									</td>
									<td>
										<input type="number" id="quanty-item-{{$product['item']['id']}}" onchange="SaveListItemCart({{$product['item']['id']}})" name="product_numb" class="product_select" value="{{$product['qty']}}">
									</td>
									<td>{{number_format($product['price'])}}</td>
									<td style="display: none;"><a class="udc" href="{{route('giohang')}}"  onclick="SaveListItemCart({{$product['item']['id']}})"><i class="fa fa-save"/></a></td>
									<td><a href="{{route('xoagiohang',$product['item']['id'])}}">X</a></td>
								</tr>
								@endforeach
							@endif
						</tbody>
					</table>
				</div>
       			<div class="row cart_total_inner">
        			<div class="col-lg-7"></div>
        			<div class="col-lg-5">
        				<div class="cart_total_text">
        					@if(Session::has('cart'))
        					<div class="cart_head">
        						Tổng giỏ hàng
        					</div>
        					<div class="sub_total">
        						<h5>Tổng số phụ <span>{{number_format(Session('cart')->totalPrice)}} VND</span></h5>
        					</div>
        					<div class="total">
        						<h4>Tổng tiền <span>{{number_format(Session('cart')->totalPrice)}} VND</span></h4>
        					</div>
        					@endif
        					<div class="cart_footer">
        						<a class="pest_btn" href="{{route('dathang')}}">Đặt hàng</a>
        					</div>

        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        <!--================End Cart Table Area =================-->
        <style type="text/css">
        	.nice-select.product_select{
        		display: none!important;
        	}
        	.product_select{
        		display: block!important;
        		width: 100%!important;
        	}
        </style>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.js"></script>
          <script type="text/javascript">
                function SaveListItemCart(id){
                    $.ajax({
                        url: 'Save-Item-List-Cart/'+id+'/'+$("#quanty-item-"+id).val(),
                        type: 'GET',
                    }).done(function(){
                        alertify.success('cập nhật giỏ hàng thành công!!');
                        setTimeout(function() { 
				    		window.location.href = $(".udc")[0].href; 
				 		}, 500);
                    });
                }
            // function RenderListCart(response){
            //     $("#list-cart").empty();
            //     $("#list-cart").html(response);
            // }
        </script>
      
@endsection