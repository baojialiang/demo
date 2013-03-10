  module PaginationHelper
  
    def pre_pagination_tag (page = 1, controller, action)
      if page == 1
        content_tag(:li, content_tag(:a, "Pre"), :class => "disabled pagination")
      else
        content_tag(:li, link_to("Pre", {
                                      :controller => controller, 
                                      :action => action, 
                                      :page => (page - 1).to_s
                                    }), 
                                    :class => "pagination")
      end
    end
  
    def next_pagination_tag(page_num, page, controller, action)
      if page < page_num
        content_tag(:li, link_to("Next", {
                                      :controller => controller, 
                                      :action => action, 
                                      :page => (page + 1).to_s
                                    }), 
                                    :class => "pagination")
      else
        content_tag(:li, content_tag(:a, "Next"), :class => "disabled pagination")
      end
    end
  end