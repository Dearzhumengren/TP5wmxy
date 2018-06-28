<?php

namespace app\admin\controller;

use app\admin\common\Base;
use app\admin\model\Admin as AdminModel;

use think\Request;

class Admin extends Base
{

    public function index()
    {
        //1.获取admin管理员表的信息
        $admin = AdminModel::get(['username'=>'admin']);
        //2.将管理员的信息赋给模板
        $this->view->assign('admin',$admin);

        //渲染模板
        return $this->view->fetch('admin_list');
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //

    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit(Request $request)
    {
        //
        //1.读取admin管理员表的信息
        $admin = AdminModel::get($request->param('id'));

        //2.将当前管理员的信息赋值给模板
        $this -> view -> assign('admin', $admin);
        //3.渲染模板
        return $this -> view -> fetch('admin_edit');
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request)
    {
        if ($request -> isAjax(true)){

            //获取提交的数据,自动过滤一下空值
            $data = array_filter($request->param());

            //设置更新条件
            $map = ['is_update' => $data['is_update']];

            //更新用户表
            $res = AdminModel::update($data, $map);

            //更新成功的提示信息
            $status = 1;
            $message = '更新成功';

            //如果更新失败
            if (is_null($res)) {
                $status = 0;
                $message = '更新失败';
            }
        }
        return ['status'=>$status, 'message'=>$message];


    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
