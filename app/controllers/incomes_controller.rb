class IncomesController < ApplicationController
    def index
       @incomes = Income.all

       @spents = Spent.all
       @income_total= @incomes.map(&:value).collect { |value| value.to_f }.sum
       @spent_total= @spents.map(&:value).collect { |value| value.to_f }.sum
    @balance= @income_total-@spent_total
    end

    def show
        @income= Income.find(params[:id])
    end 

    def create
        @income = Income.new(income_params)
        if @income.save
          redirect_to(@income)
        else
          render "new"
        end
    end

    def new
        @income = Income.new
      end

      def destroy
        @income= Income.find(params[:id])
        @income.destroy
        redirect_to incomes_path

      end

      def edit 
        @income = Income.find(params[:id])
      end

      def update
        @income = Income.find(params[:id])
        respond_to do |format|
          if @income.update(income_params)
            format.html { redirect_to @income, notice: 'income was successfully updated.' }
            format.json { render :show, status: :ok, location: @income }
          else
            format.html { render :edit }
          end
        end
      end


      private
      def income_params
        params.require(:income).permit(:category,:value,:description)
      end
end
