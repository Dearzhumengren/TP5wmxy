<?php
namespace app\index\controller;

use app\index\common\Base;
use think\Db;
use app\index\model\News;

class Index extends Base
{
    public function index()
    {
        //轮播图
        $banner = Db::name('banner')
            ->limit(6)
            ->select();

            //按浏览量排序查询6条数据
        $newlist = Db::name('news')
            ->order('news_vis','desc')
            ->paginate(5);

            //按时间排序查询6条数据
        $newslist = Db::name('news')
            ->order('create_at','desc')
            ->limit(6)
            ->select();


        $this->assign('banner',$banner);
        $this->assign('new_list',$newlist);
        $this->assign('news_list',$newslist);

        return $this->fetch();
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

