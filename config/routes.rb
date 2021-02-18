# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        home#index
#                     api_v1_home_index GET    /api/v1/home(.:format)                                                                   api/v1/home#index {:format=>/json/}
#                          api_v1_users POST   /api/v1/users(.:format)                                                                  api/v1/users#create {:format=>/json/}
#                           api_v1_user GET    /api/v1/users/:firebase_uid(.:format)                                                    api/v1/users#show {:format=>/json/}
#                                       PATCH  /api/v1/users/:firebase_uid(.:format)                                                    api/v1/users#update {:format=>/json/}
#                                       PUT    /api/v1/users/:firebase_uid(.:format)                                                    api/v1/users#update {:format=>/json/}
#                                       DELETE /api/v1/users/:firebase_uid(.:format)                                                    api/v1/users#destroy {:format=>/json/}
#               api_v1_contact_us_forms POST   /api/v1/contact_us_forms(.:format)                                                       api/v1/contact_us_forms#create {:format=>/json/}
#             get_reviews_api_v1_places POST   /api/v1/places/get_reviews(.:format)                                                     api/v1/places#get_reviews {:format=>/json/, :param=>[:gmap_place_id]}
#              get_rating_api_v1_places POST   /api/v1/places/get_rating(.:format)                                                      api/v1/places#get_rating {:format=>/json/, :param=>[:gmap_place_id]}
#                        api_v1_reviews POST   /api/v1/reviews(.:format)                                                                api/v1/reviews#create {:format=>/json/}
#                         api_v1_review DELETE /api/v1/reviews/:id(.:format)                                                            api/v1/reviews#destroy {:format=>/json/}
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'home#index'

  
  namespace 'api' do
    namespace 'v1', format: 'json' do
      resources :home, only: [:index]
      resources :users, param: :firebase_uid, only:[:create, :show, :update, :destroy]
      resources :contact_us_forms, only: [:create]
      resources :places, only:[] do
        post 'get_reviews', :controller => 'places', :action => 'get_reviews', as:'get_reviews', param: [:gmap_place_id], on: :collection
        post 'get_rating', :controller => 'places', :action => 'get_rating', as:'get_rating', param: [:gmap_place_id], on: :collection
      end
      resources :reviews, only:[:create, :destroy]
    end
  end
end
