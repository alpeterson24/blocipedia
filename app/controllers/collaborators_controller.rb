class CollaboratorsController < ApplicationController
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborate_users.all
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    authorize(@wiki.collaborators)
  end

  def create
    wiki = Wiki.find(params[:wiki_id])
    collaborators = []
    wiki.collaborators.destroy_all
    params[:collaborators].each do |c|
        collaborators << {
            wiki_id: wiki.id,
            user_id: c}
    end

    Collaborator.create(collaborators)
    redirect_to wiki_collaborators_path(wiki)
  end
end
