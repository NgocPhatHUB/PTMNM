<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductType;
use App\Category;
use App\Product;
use App\Supplier;
use App\Supplier1;

class ProductController extends Controller
{
    //
    public function getDanhSach(){
    	// $product = Product::orderBy('id','DESC')->get();
        $product = Product::orderBy('id','DESC')->where('status','')->paginate(20);
        return view('admin.sanpham.danhsach',['product'=>$product]);
    }

     public function getEdit($id){
        $loaisp = ProductType::all();
        $danhmuc = Category::all();
        $nhacc = Supplier::all();
        $nhacc1 = Supplier1::all();
        $product = Product::find($id);
        return view('admin.sanpham.edit',['loaisp'=>$loaisp,'danhmuc'=>$danhmuc,'nhacc'=>$nhacc,'product'=>$product,'nhacc1'=>$nhacc1]);
    }

    public function postEdit(Request $req,$id){
      $product = Product::find($id);
      $this->validate($req,
            [
                'type_products'=>'required',
                'name'=>'required|min:2',
                'des' => 'required|min:10',
            ],
            [
                'type_products.required'=>'Bạn chưa chọn loại sản phẩm!',
                'name.required'=>'Bạn chưa nhập tên sản phẩm',
                'name.min'=>'Tên sản phẩm ít nhất 2 ký tự',
                'des.required'=>'Bạn chưa nhập mô tả',
                'unit_price.required'=>'bạn chưa nhập giá cho sản phẩm',
            ]);

                $product->name = $req->name;
                $product->id_type = $req->type_products;
                $product->id_category = $req->category;
                $product->id_supplier = $req->supplier;
                // $product->id_ncc = $req->ncc;
                $product->description = $req->des;
                // $product->parameter = $req->parameter;
                // $product->origin = $req->origin;
                // $product->guarantee = $req->guarantee;
                $product->unit_price = $req->unit_price;
                $product->promotion_price = $req->promotion_price;
                $product->image = $req->img;
                $product->unit = $req->unit;
                $product->new = $req->new;
                $product->save();
                return redirect('admin/sanpham/edit/' .$id)->with('thongbao','Sửa thành công!');

    }

     public function getAdd()
     {
        $loaisp = ProductType::all();
        $nhacc = Supplier::all();
        $danhmuc = Category::all();
     	return view('admin.sanpham.add',['loaisp'=>$loaisp,'danhmuc'=>$danhmuc,'nhacc'=>$nhacc]);
    }

    public function postAdd(Request $req)
    {
    	$this->validate($req,
            [
                'type_products'=>'required',
                // 'category'=>'required',
                'name'=>'required|min:2',
                'des' => 'required|min:10|max:5550',
                'unit_price'=>'required',
                'img'=>'required'
            ],
            [
                'type_products.required'=>'Bạn chưa chọn loại sản phẩm!',
                // 'category.required'=>'Bạn chưa chọn danh mục sản phẩm!',
                'name.required'=>'Bạn chưa nhập tên sản phẩm',
                'name.min'=>'Tên sản phẩm ít nhất 2 ký tự',
                'des.required'=>'Bạn chưa nhập mô tả',
                'unit_price.required'=>'bạn chưa nhập giá cho sản phẩm',
                'img.required'=>'Bạn chưa nhập ảnh cho sản phẩm'
            ]);
        $product = new Product;
        $product->name = $req->name;
        $product->id_type = $req->type_products;
        $product->id_category = $req->category;
        $product->id_supplier = $req->supplier;
        // $product->id_ncc = $req->ncc;
        $product->description = $req->des;
        // $product->parameter = $req->parameter;
        // $product->origin = $req->origin;
        // $product->guarantee = $req->guarantee;
        $product->unit_price = $req->unit_price;
        $product->promotion_price = $req->promotion_price;
        $product->image = $req->img;
        $product->unit = $req->unit;
        $product->new = $req->new;
        $product->status = '';
        $product->save();
        return redirect('admin/sanpham/add')->with('thongbao','Thêm sản phẩm thành công');

    }

    // public function getDelete($id){
    //     $product = Product::find($id);
    //     $product->delete();

    //     return redirect('admin/sanpham/danhsach')->with('thongbao','Xóa thành công!');
    // }
     public function getHuy(Request $id){
        $product = Product::where('status','đã hủy')->paginate(10);
        return view('admin.sanpham.delete',compact('product'));
    }

    public function postHuy(Request $id){
        $product = Product::find($id);
        $product = Product::where('id',$id->id)->first();
        $product->status = 'đã hủy';
        $product->save();
        return redirect()->back()->with('thongbao','Đã xóa sản phẩm!');
    }
}
