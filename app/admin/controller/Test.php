<?php
namespace app\admin\controller;

use app\admin\common\Base;
use app\admin\model\Admin;
use app\admin\model\News as NewsModel;
use think\Controller;
use think\Request;

class Test extends Controller{


    public function index(Request $request)
    {
        /*$news = new NewsModel();
        $rowarr = NewsModel::all();*/

        $da = $request->param();



        $cate_time = date("Y-m-d H:i:s",time());


        $pas = md5($da['password']);
        $map =['username' => 'admin'];
        $admin = Admin::get($map);
        $pass=$admin->password;

        $rows_list = NewsModel::order(['news_id'])->paginate(5);
      /*  $row = NewsModel::get(1);
        $var1=$row->news_id;
        $var2=$row->news_title;*/

       /* $count = $news->count();

        $list = Admin::get(1);
        $id=$list->id;*/
        $this->view->assign('pas',$pas);
        $this->view->assign('pos',$pass);
        $this->view->assign('row',$rows_list);

        $this->view->assign('tie',$cate_time);
       /* foreach ($rowarr as $key=>$user)
        {
            echo $user->news_title;
        }*/
/*
        echo $id."<hr>";
        echo $var1."<hr>";
        echo $var2."<hr>";
        echo $count."<hr>";*/


        return $this->view->fetch('index');
    }
    public function test()
    {
        return $this->view->fetch('test');
    }

}