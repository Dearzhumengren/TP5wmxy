<?php
namespace app\index\controller;

use app\index\common\Base;
use app\index\model\News as Newsmodel;
use think\Db;

class News extends Base
{
    public function index()
    {

        return $this->view->fetch('index/index');
    }


    public function listing($tyid=0)
    {
        //查询分页
        $res=Db::name('news')->where('news_tyid', $tyid)
            ->order('create_at', 'asc')
            ->paginate(2,false,[
                'query' => request()->param(),
            ]);


        //按时间排序查询6条数据
        $nelis = Db::name('news')
            ->order('create_at','desc')
            ->limit(6)
            ->select();





        $this->view->assign('news',$res);

        $this->view->assign('new_lis',$nelis);

        return $this->view->fetch('news_list');

    }




    public function conn($newid=0)
    {
        //根据id查询
        $ret = Db::name('news')
            ->where('news_id',$newid)
            ->find();

        //浏览统计
         Db::name('news')
            ->where('news_id',$newid)
            ->setInc('news_vis',1,5);

        //按时间排序查询6条数据
        $nelis = Db::name('news')
            ->order('create_at','desc')
            ->limit(6)
            ->select();

        $this->view->assign('new_con',$ret);

        $this->view->assign('new_lis',$nelis);

        return $this->view->fetch('news_con');
    }




    public function login()
    {
        return $this->view->fetch('Login/login');
    }

    public function register()
    {
        return $this->view->fetch('Login/register');
    }

}