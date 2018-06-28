<?php
namespace app\admin\controller;

use think\Db;
use think\Request;
use app\admin\common\Base;

use app\admin\model\News as NewsModel;
use app\admin\model\Category;

class News extends Base
{
    public function index()
    {

        //实列化模型
        $news = new NewsModel();

        //查询所有数据
        //$rows = NewsModel::all();


        //查询分类表
        $new_list = Category::all();


        //分页数据
        $new_page = NewsModel::order(['news_id'])->paginate(5);

        //获取所有记录数量
        $count = $news->count();

        $this->view->assign('row_list',$new_page);



        $this->view->assign('count',$count);//模板变量赋值

        //渲染
        $this->view->assign('new_list',$new_list);

        //$this->view->assign('new_page',$new_page);

        return $this->view->fetch('news_list');

    }

    //添加新闻
    public function create()
    {

        return $this->view->fetch('news_add');
    }

    //保存新闻
    public function save()
    {
        //判断提交类型
        if(request()->isPost()){

            //1.获取一下提交的数据,包括上传文件
            $data = $this->request->param(true);

            //2获取一下上传的文件对象
            $file = $this->request->file('news_img');

            //3判断是否获取到了文件
            if (empty($file)) {
                $this->error($file->getError());
            }

            //4上传文件
            $map = [
                'ext'=>'jpg,png',
                'size'=> 3000000
            ];
            $info = $file->validate($map)->move(ROOT_PATH.'public/uploads/');
            if (is_null($info)){
                $this->error($file->getError());
            }





            //5向表中新增数据
            $data['news_img'] = $info -> getSaveName();

            $res = NewsModel::create($data);


            if (is_null($res)){
                $this->error('新增失败');
            }

            //6判断新增是否成功
            $this->success('新增成功~~');

        }else {
            $this -> error('请求类型错误~~');
        }


    }



    public function read($id)
    {

    }



    public function edit($id=0)
    {
        //1.获取一下分类id

            $nid = $_GET['id'];

            $new_data = NewsModel::get($nid);


            //4.模板赋值
            $this->view->assign('new_now', $new_data);


            //5.渲染模板
            return $this->view->fetch('news_edit');

    }


    public function update(Request $request)
    {
        //1.获取一下提交的数据

        //判断提交类型
        if (request()->isPost()) {


            //1.获取一下提交的数据,包括上传文件
            $data = $this->request->param(true);

            //2获取一下上传的文件对象
            $file = $this->request->file('news_img');

            //3判断是否获取到了文件
            if (empty($file)) {

                $this->error($file->getError());
            }

            //4上传文件
            $map  = [
                'ext'  => 'jpg,png',
                'size' => 3000000
            ];
            $info = $file->validate($map)->move(ROOT_PATH . 'public/uploads/');
            if (is_null($info)) {
                $this->error($file->getError());
            }


            $data['news_img'] = $info->getSaveName();
            //2.更新操作
            $res = NewsModel::update([
                'news_title' => $data['news_title'],
                'news_type'  => $data['news_type'],
                'news_tyid'  => $data['news_tyid'],
                'news_aut'   => $data['news_aut'],
                'news_img'   => $data['news_img'],
                'news_con'   => $data['news_con'],
            ],['news_id'=>$data['news_id']]);

            //3.设置返回值
            $status  = 1;
            $message = '更新成功';

            //4.设置更新失败的返回值
            if (is_null($res)) {
                $status  = 0;
                $message = '更新失败';
            }

            //5.返回结果
            return ['status' => $status, 'message' => $message];
        }

    }
    public function delete($id)
    {

        //2.删除当前分类
        NewsModel::destroy($id);
    }


}