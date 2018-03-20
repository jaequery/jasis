module Sequel
  class Model
    module ClassMethods

      def skeleton
        row = self.first
        row.each{|k, v|
          row[k] = nil
        }
      end

      def list(params)
        q = self

        # search
        if !params[:search].blank?
          q = q.where(Sequel.ilike(:name, "%#{params[:search]}%"))
        end

        # limits / offsets
        if !params[:per_page].blank?
          page = params[:page] || 1
          per_page = params[:per_page] || 50
          q = q.paginate(page, per_page)
        end

        # order by
        order_by = (params[:order_by].downcase if !params[:order_by].blank?) || 'id'
        order_dir = (params[:order_dir].downcase if !params[:order_dir].blank?) || 'desc'
        q = q.reverse(order_by.to_sym) if order_dir == 'desc'
        q = q.order(order_by.to_sym) if order_dir == 'asc'

        # retrieve
        return q
      end
      
    end

    module InstanceMethods
      
    end
    
  end
end