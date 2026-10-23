```markdown
# 基于人脸识别的实验室管理系统

> 本科毕业设计项目 — 管理信息系统 + 智能接口集成  
> 技术栈：Django 5 + PostgreSQL 16 + Vue 3 + face_recognition + Docker Compose

## 一、项目简介

系统面向高校实验室场景，实现实验室预约、课程/人员管理、签到核验、设备使用记录、统计与日志。
核心智能能力：**基于人脸识别的 1:1 签到核验**（不使用 1:N 检索，学生已登录，系统已知其账号）。

## 二、技术栈

| 层次 | 技术 |
|------|------|
| 前端 | Vue 3 + Vite + Element Plus + ECharts + Pinia + Vue Router |
| 后端 | Django 5 + Django REST Framework + SimpleJWT |
| 数据库 | PostgreSQL 16 |
| 人脸识别 | face_recognition + dlib-bin（CPU 可运行） |
| 部署 | Docker Compose |

## 三、快速启动

```bash
git clone https://github.com/imash1999/lab-face-system
```

### 前置要求
- Docker Desktop（已在 WSL 中集成）
- 无需单独安装 Python / Node.js / PostgreSQL

### 依赖包准备（首次运行前）
由于项目未将 `wheelhouse/` 提交到仓库（文件较大），需要先下载依赖：

```bash
mkdir wheelhouse
pip download --dest wheelhouse \
  dlib-bin face-recognition face-recognition-models \
  Click Pillow numpy Django psycopg2-binary \
  djangorestframework djangorestframework-simplejwt django-cors-headers \
  --platform manylinux2014_x86_64 \
  --python-version 311 \
  --only-binary=:all: \
  -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 一键启动

```bash
docker compose up -d --build
```

首次构建约 5–10 分钟（编译 dlib / 拉取依赖）。之后启动约 10 秒。

**演示数据自动加载**：项目包含 `full_dump.sql`，PostgreSQL 在首次启动时会自动执行，创建 4 个用户、2 个实验室、1 个课程、1 个签到任务。

### 访问地址

| 服务 | 地址 |
|------|------|
| 前端（Vue + Nginx） | http://localhost |
| 后端 API | http://localhost:8000/api/ |
| Django Admin | http://localhost:8000/admin/ |

### 测试账号

| 用户名 | 密码 | 角色 |
|--------|------|------|
| admin | admin123 | 系统管理员 |
| teacher1 | teacher123 | 教师 |
| student1 | student123 | 学生 |
| student2 | student123 | 学生 |

### 如何重置数据库

```bash
docker compose down -v   # 删除 PostgreSQL volume
docker compose up -d     # 重启，full_dump.sql 自动重新加载
```

## 四、核心功能与演示流程

### 1. 登录（LAB-F01）
打开 http://localhost ，使用 `admin / admin123` 登录。
后端使用 JWT，前端拦截器自动携带 `Authorization: Bearer <token>`。

### 2. Dashboard（LAB-F10）
登录后自动进入仪表盘，展示：
- 今日预约 / 今日签到 / 今日迟到 / 开放实验室 4 个指标
- 近 7 天签到趋势（折线图）
- 签到状态分布（环形图）

所有数据均来自 PostgreSQL 真实查询，非硬编码。

### 3. 人脸绑定（LAB-F05）
学生登录后调用 `POST /api/face/enroll/`，上传一张人脸照片。
后端使用 `face_recognition` 提取 128 维特征向量，存入 `core_faceprofile.face_token`。

### 4. 人脸签到（LAB-F07）—— 核心演示
1. 学生登录 → 签到页 → 选择签到任务 → 点击「人脸签到」
2. 上传一张现场照片
3. 后端对「当前照片」与「该账号已绑定人脸」做 1:1 核验
4. 通过则写入 `core_attendancerecord`，按时间判定 `normal` / `late`
5. 重复签到会被 `unique_together(task, student)` 拦截

### 5. 业务校验（LAB-F04）
预约申请通过 Serializer 校验：
- 结束时间必须晚于开始时间
- 同一实验室的「已通过」预约时间段不得重叠

## 五、项目结构

```text
lab-face-system/
├── config/                 # Django 配置
├── core/                   # 核心业务
│   ├── models.py           # 12 张业务表
│   ├── serializers.py      # DRF 序列化
│   ├── api.py              # REST 接口
│   ├── services.py         # 人脸识别服务
│   └── admin.py            # 后台管理
├── frontend/               # Vue 3 前端
│   ├── src/
│   │   ├── api/            # Axios 封装
│   │   ├── stores/         # Pinia（JWT 状态）
│   │   ├── router/         # 路由 + 守卫
│   │   ├── layouts/        # 主布局
│   │   └── views/          # 页面
│   ├── Dockerfile          # 前端构建
│   └── nginx.conf          # 反向代理 /api → web:8000
├── wheelhouse/             # 离线安装的 Python 依赖（需自行下载）
├── Dockerfile              # 后端镜像
├── docker-compose.yml      # 全栈编排
├── full_dump.sql           # 演示数据 dump
└── README.md
```

## 六、API 接口一览

| 方法 | 路径 | 用途 |
|------|------|------|
| POST | `/api/auth/login/` | 登录，返回 access + refresh |
| POST | `/api/auth/refresh/` | 刷新 access token |
| GET | `/api/users/me/` | 当前用户信息 |
| GET/POST | `/api/labs/` | 实验室列表 / 创建 |
| GET/POST | `/api/reservations/` | 预约列表 / 提交 |
| POST | `/api/face/enroll/` | 人脸绑定（multipart） |
| GET | `/api/checkin/tasks/` | 签到任务列表 |
| POST | `/api/checkin/tasks/{id}/verify/` | 人脸核验并签到 |
| GET | `/api/attendance/` | 考勤记录查询 |
| GET | `/api/dashboard/summary/` | 首页统计数据 |

## 七、数据库设计（12 张表）

| 表名 | 用途 |
|------|------|
| `core_user` | 用户（含角色：admin / lab_admin / teacher / student） |
| `core_laboratory` | 实验室 |
| `core_courseactivity` | 课程/活动 |
| `core_coursemember` | 活动学生名单 |
| `core_reservation` | 预约申请 |
| `core_faceprofile` | 人脸档案 |
| `core_checkintask` | 签到任务 |
| `core_attendancerecord` | 签到记录 |
| `core_equipment` | 设备台账 |
| `core_equipmentuse` | 设备使用记录 |
| `core_recognitionrecord` | 识别调用记录 |
| `core_operationlog` | 操作日志 |

## 八、人脸识别说明

- 使用 `face_recognition`（dlib）在 CPU 上提取 128 维特征
- 1:1 核验：计算欧氏距离，阈值 0.6（SRS 建议值）
- 不保存签到原始照片，只保存特征向量和识别结果（符合 SRS 隐私最小化原则）
- 识别服务失败时返回明确错误信息，不产生半完成数据

## 九、测试与验收

对应 SRS 第 9 章必测用例：

| 编号 | 场景 | 预期 |
|------|------|------|
| TC-01 | 预约冲突 | 系统提示冲突，不写入 |
| TC-04 | 人脸绑定 | 绑定成功并可用于签到 |
| TC-06 | 窗口内核验 | 生成一条签到，状态正常/迟到 |
| TC-07 | 重复签到 | 返回已有记录，不新增 |
| TC-08 | 非名单学生 | 拒绝签到 |
| TC-10 | 越权访问 | 后端返回 403 |

## 十、已知限制与后续可扩展

- 未做活体检测（SRS 中标注为加分项）
- 二维码签到作为人脸失败备用方案未实现
- 设备使用记录仅 MVP 级别（台账 + 开始/结束）
- 未与学校统一身份认证对接（SRS 中明确不要求）
- 未实现前台注册页面（用户由管理员在 Admin 创建或通过 dump 预置）

## 十一、作者

- 项目类型：本科毕业设计
- 技术路线：软件工程 / 管理信息系统 + 智能接口集成
- 文档版本：V1.0


