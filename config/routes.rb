Rails.application.routes.draw do
  # 设置默认路由
  root 'welcome#index'

  get 'work' => 'work#index'

  mount CourseTestApi =>'/coursetest'

  mount TeacherApi =>'/teachers'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
