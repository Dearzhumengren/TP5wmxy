<?php
namespace app\index\controller;

use app\index\common\Base;
use think\Db;
use app\index\model\News;
class Test extends Base
{
    public function index()
    {
        $newlist = Db::name('news')->order('create_at','asc')->limit(5)->select();

       // $newlist->order('create_at','desc')->limit(6)->select();

        $this->assign('new_list',$newlist);
        return $this->view->fetch('index');
    }
}