<?php

namespace app\admin\controller;

use app\admin\common\Base;
use think\Request;

class System extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //2.模板赋值
        $this -> view -> assign('system', $this->getSystem());

        //3.渲染模板
        return $this -> view -> fetch('system_list');
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
    public function edit($id)
    {
        //
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
        //判断一下提交类型
        if ($request -> isAjax(true)) {

            //获取提交的数据
            $data = $request -> param();

            //设置一下更新条件
            $map = ['is_update'=> $data['is_update']];

            //执行更新操作
            $res = SystemModel::update($data, $map);

            //设置更新返回信息
            $status = 1;
            $message = '更新成功';

            //如果更新失败
            if (is_null($res)) {
                $status = 0;
                $message = '更新失败';
            }
        }

        //返回更新结果
        return ['status'=> $status, 'message'=> $message];
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
