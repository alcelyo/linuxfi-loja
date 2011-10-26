module ApplicationHelper

  def t( key )
    I18n.translate( key )
  end

end
