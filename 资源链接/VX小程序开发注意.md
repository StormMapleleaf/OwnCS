# VX小程序开发注意

## 样式问题

1. vant组件的外部样式可自定义class名来修改样式，自定义组件相同

   ```tsx
   //设置外部样式覆盖
   {
   "styleIsolation": "apply-shared"
   }
   
   //自定义属性
    properties: {
       extClass: {
         type: String,
         value: ''
       }
     },
   
   //wxml_define
   <view class="classOne {{extClass}}" ></view>
       
   //wxml_use  此时可通过a来覆盖css样式
   <test extClass="a"></test>
   ```

   

## npm构建

```json
//project.config.json
"packNpmManually": true,
    "packNpmRelationList": [
      {
        "packageJsonPath": "./package.json",
        "miniprogramNpmDistDir": "./miniprogram/"
      }
    ],
```

