# 现在有一个学生选课系统的后台API需要你来实现，模型关系如下：

1. Model 分为学生，老师，课程三种，所有的模型都只有 id 和 name两个属性（关联字段除外）；

2. 学生与老师，学生与课程均为多对多关系（N to N）；

3. 一名老师能带多门课程，但同一门选修课只会由一名老师带（1 to N）。

# 请用 Rails5 的API 模式实现上述模型的关联关系，并实现以下接口：

1. `GET /students/:id`, 以 Json 返回该名学生的所有课程与对应课老师的信息；

2. `GET /teachers`, 以 Json 返回所有的老师及其所带课程的信息；

3. `DELETE /teachers/:id`, 删除该老师与所带课程的全部信息。

# 解答

```ruby
# students_controller.rb
def show
  @student = Student.find(params[:id])

  render :json @student.to_json(include: { courses: { include: :teacher } } )
end

# teachers_controller.rb
def index
  @teachers = Teacher.all

  render :json @teachers.to_json(include: :courses)
end

```
# to_json
https://stackoverflow.com/questions/9983436/nesting-json-include-in-rails

# api document
ActiveModel::Serializer::JSON#as_json
```
as_json(options = nil) Link
Returns a hash representing the model. Some configuration can be passed through options.

The option include_root_in_json controls the top-level behavior of as_json. If true, as_json will emit a single root node named after the object's type. The default value for include_root_in_json option is false.

user = User.find(1)
user.as_json
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#     "created_at" => "2006/08/01", "awesome" => true}

ActiveRecord::Base.include_root_in_json = true

user.as_json
# => { "user" => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#                  "created_at" => "2006/08/01", "awesome" => true } }
This behavior can also be achieved by setting the :root option to true as in:

user = User.find(1)
user.as_json(root: true)
# => { "user" => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#                  "created_at" => "2006/08/01", "awesome" => true } }
Without any options, the returned Hash will include all the model's attributes.

user = User.find(1)
user.as_json
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#      "created_at" => "2006/08/01", "awesome" => true}
The :only and :except options can be used to limit the attributes included, and work similar to the attributes method.

user.as_json(only: [:id, :name])
# => { "id" => 1, "name" => "Konata Izumi" }

user.as_json(except: [:id, :created_at, :age])
# => { "name" => "Konata Izumi", "awesome" => true }
To include the result of some method calls on the model use :methods:

user.as_json(methods: :permalink)
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#      "created_at" => "2006/08/01", "awesome" => true,
#      "permalink" => "1-konata-izumi" }
To include associations use :include:

user.as_json(include: :posts)
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#      "created_at" => "2006/08/01", "awesome" => true,
#      "posts" => [ { "id" => 1, "author_id" => 1, "title" => "Welcome to the weblog" },
#                   { "id" => 2, "author_id" => 1, "title" => "So I was thinking" } ] }
Second level and higher order associations work as well:

user.as_json(include: { posts: {
                           include: { comments: {
                                          only: :body } },
                           only: :title } })
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#      "created_at" => "2006/08/01", "awesome" => true,
#      "posts" => [ { "comments" => [ { "body" => "1st post!" }, { "body" => "Second!" } ],
#                     "title" => "Welcome to the weblog" },
#                   { "comments" => [ { "body" => "Don't think too hard" } ],
#                     "title" => "So I was thinking" } ] }
Source: show | on GitHub
```
