ExecIo::Application.routes.draw do
  match 'charge' => 'home#charge'
  root :to => 'home#index'
end
