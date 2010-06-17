class WordsmithHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%=  tab(:wordsmith , { :label => t("Wordsmith"), :route => :admin_posts })  %>) 
  end
  
  insert_after :admin_user_form_fields do
    %(<%= render :partial => 'display_name', :locals => {:f => f}  %>)
  end  
end