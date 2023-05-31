class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id]) # レコード1件を取得
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params) # レコードを更新
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy  # レコードを削除
    redirect_to '/lists'  #投稿一覧画面/listsへリダイレクト
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
