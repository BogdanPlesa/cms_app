class SectionsController < ApplicationController
  
  layout "admin"
  
 # **** READ *****
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end
# ***************

# ***** CREATE *****
  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    #Instantiate a new object using form parameters
    @section = Section.new(section_params)
    #Save the object
    if @section.save
      #If save succeds, redirect to the index action
      flash[:notice] = "section created succesfully"
      redirect_to(:action => 'index')
    else
      #If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
# *******************



# ***** UPDATE *****
  def edit
    @section = Section.find(params[:id])
  end

  def update
    #Find an existing object using form parameters
    @section = Section.find(params[:id])
    #Update the object
    if @section.update_attributes(section_params)
      #If update succeds, redirect to the index action
      flash[:notice] = "section updated succesfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
# *******************

# ***** DELETE *****
  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "section #{section.name} destroyed succesfully"
    redirect_to(:action => 'index')
  end
# ******************


  private

    def section_params
      # same as using "params[:sections]", exceppt that it:
      # - raises an error if :section is not present
      # - allows listed attributes to be mass assigned
      params.require(:section).permit(:page_id, :name, :permalink, :position, :visible, :content_type, :content)
    end

end

