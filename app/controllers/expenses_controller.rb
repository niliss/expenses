  class ExpensesController < ApplicationController
  def index
  	@expenses = Expense.all
  end
  

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new params[private_params]
    if @expense.save
      redirect_to expenses_path
    else
      render :action => 'new'
    end
  end

  def edit
    @expense = Expense.find params[:id]
  end

  def update
    @expense = Expense.find params[:id]
    if @expense.update_attributes params[private_params]
      redirect_to expenses_path
    else
      render :action => :edit
    end
  end

  def destroy
    @expense = Expense.find params[:id]
    @expense.destroy
    redirect_to expenses_path
  end

  def show
    @expense = Expense.find params[:id]
  end

  private

  def private_params
    params.require(:expense).permit(:concept, :fecha, :amount)
  end

end
