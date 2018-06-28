<?php
namespace app\admin\model;
use think\model;
use think\Collection;
class News extends Model
{
    //开启时间戳
    protected $autoWriteTimestamp = true;


    protected $createTime = 'create_at';
    protected $updateTime = 'update_at';


}