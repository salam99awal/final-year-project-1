Rails.application.routes.draw do
  resources :promotes
  resources :note_uploads
  resources :misc_uploads
  resources :student_attendances
  resources :lessons
  resources :setup_fees
  resources :collect_fees
  resources :subject_masters
  resources :roles
  devise_for :users
    resources :report_forms
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/index', :as => 'assess'
  root 'home#homepage'
  resources :remarks
  resources :grades
  resources :assessment_masters
  resources :assessments do
    collection do
      put 'update_all_is_old', to: 'assessments#update_all_is_old'
    end
  end
  
  
  resources :teachers
  resources :subjects
  resources :students do
    post 'promote', on: :member
  end  
  resources :class_fields
  get 'check_grade' =>'assessments#check_grade'
  get 'report' => 'grades#report'
  get 'homepage' => 'home#homepage', as: 'homepage'

  get 'uploadmisc' => 'home#uploadmisc'
  get 'uploadingmisc' => 'home#uploadingmisc'

    get 'uploadingNotes' => 'lessons#uploadingNotes'
      get 'view_uploadingNotes' => 'lessons#view_uploadingNotes'

    post 'update_lesson'                          =>     'lessons#update_lesson'
  
  get 'send_email' => 'grades#send_email'
  post 'create_ajax' => 'assessments#create_ajax'
  get 'retrieve' => 'assessments#retrieve'
  delete 'custom_delete', to: 'assessments#custom_delete'
  put 'custom_update', to: 'assessments#custom_update'

  post 'students/promote_all', to: 'students#promote_all', as: 'promote_all_students'


  


  get 'delete_assessment' => 'assessments#delete_assessment'
  get 'main' => 'collect_fees#main'
  get 'fees' => 'collect_fees#fees'
  get 'fees_payment' => 'collect_fees#fees_payment'
  get 'find_fees' => 'collect_fees#find_fees'
  get 'view_fees' => 'collect_fees#view_fees'

  get 'teaching' => 'lessons#teaching'
  get 'subject_list' => 'lessons#subject_list'
  post 'update_teaching' => 'lessons#update_teaching'
  get 'record_activity' => 'lessons#record_activity'
  post 'record_activity_post' => 'lessons#record_activity_post'

  get 'lesson_details'  => 'lessons#lesson_details'
  get 'student_details'  => 'students#student_details'
  get 'students_list'  => 'assessments#students_list'
  get 'view_assesments'  => 'assessments#view_assesments'
  get 'edit_assess'  => 'assessments#edit_assess'
  post 'update_assessment'  => 'assessments#update_assessment'

  

  get 'today_attendance' => 'student_attendances#today_attendance'
  
  post 'import_students', to: 'students#import_students'


  get 'teachers_lists' => 'users#teachers_lists'
  get 'teachers_attendance' => 'lessons#teachers_attendance'


  get 'users' => 'users#index'
  get '/users/new' => 'users#new', :as => 'new_user'
  post 'create_user' => 'users#create', as: :create_user

  get '/users/:id/edit' => 'users#edit', :as => 'edit_user'
  delete '/users/:id' => 'users#destroy', as: 'delete_user'

  get '/users/:id' => 'users#show', :as => 'user'
  patch '/users/:id' => 'users#update', :as => 'update_user'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
