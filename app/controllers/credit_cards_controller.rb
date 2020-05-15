module Spree
    class CreditCardsController < Spree::StoreController
      include ::Spree::BaseHelper



      def index
        p 'CreditCardsController#index'
        @credit_cards = try_spree_current_user.credit_cards
        @payment_sources = @credit_cards
      end
  
      def create
        @credit_card =  try_spree_current_user.credit_cards.build(payment_source_params)
        if @credit_card.save
          flash[:notice] = Spree.t(:successfully_created, scope: :credit_cards)
          redirect_to spree.account_path
        else
          render action: 'new'
        end
      end
  
      def edit
        session['spree_user_return_to'] = request.env['HTTP_REFERER']
      end
  
      def new
        
        @credit_card = try_spree_current_user.credit_cards
        if !@credit_card.present?
          @credit_card = try_spree_current_user.credit_cards.new
        end

      end
  
      def update
        if @credit_card.editable?
          if @credit_card.update(payment_source_params)
            flash[:notice] = Spree.t(:successfully_updated, scope: :credit_cards)
            redirect_back_or_default(credit_card_path)
          else
            render :edit
          end
        else
          new_payment_source = @credit_card.clone
          new_payment_source.attributes = payment_source_params
          @payment_source_params.update_attribute(:deleted_at, Time.current)
          if new_payment_source.save
            flash[:notice] = Spree.t(:successfully_updated, scope: :credit_cards)
            redirect_back_or_default(credit_card_path)
          else
            render :edit
          end
        end
      end
  
      def destroy
        try_spree_current_user.credit_cards.find(params[:id]).destroy
        
        flash[:notice] = Spree.t(:successfully_removed, scope: :credit_cards)
        redirect_to(request.env['HTTP_REFERER'] || credit_cards_path) unless request.xhr?
      end
      def meta_data_tags
        meta_data.map do |name, content|
          tag('meta', name: name, content: content) unless name.nil? || content.nil?
        end.join("\n")
      end
      private
  
      def payment_source_params
        params.require(:payment_source)[0].permit(:name, :number, :expiry, :verification_value, :cc_type)
      end


    end
  end

  