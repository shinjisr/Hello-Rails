class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      # success
      redirect_to candidates_path, notice: "新增候選人成功！"
    else
      # fail
      render :new
    end
  end

  def edit # find out the data that we want to edit.
  end

  def update
    if @candidate.update(candidate_params)
      # success
      redirect_to candidates_path, notice: "資料更新成功！"
    else
      # fail
      render :edit
    end
  end

  def destroy
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "候選人資料已刪除！"
  end

  def vote
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    # @candidate.increment(:votes)
    # @candidate.save
    flash[:notice] = "完成投藥！" # typo by purpose, to see if this line work, but turns out it didn't work at all
    redirect_to candidates_path, notice: "完成投票！"
  end


  private # 不公開存取區域
  def candidate_params
    params.require(:candidate).permit(:name, :gender, :age, :party, :politics)
  end

  def find_candidate
    begin # 若無其他邏輯判斷，還可以省略 begin
      @candidate = Candidate.find(params[:id])
    rescue
      redirect_to candidates_path, notice: "查無此候選人"
    end
  end
end
