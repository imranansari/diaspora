module InvitationCodesHelper
  def invite_welcome_message
    if invite.present?
      content_tag(:div) do
        person_image_link(invite.user.person) +  
        I18n.translate('invitation_codes.excited', :name => invite.user.name)
      end
    end
  end

  def invite_hidden_tag(invite)
    if invite.present?
      hidden_field_tag 'invite[token]', invite.token
    end
  end

  def invite_link(invite_code)
    text_field_tag :invite_code, invite_code_url(@invite_code), :readonly => true
  end

  def invited_by_message
    inviter = current_user.invited_by.person
    if inviter.present?
      contact = current_user.contact_for(inviter) || Contact.new 
      render :partial => 'people/add_contact', :locals => {:inviter => inviter, :contact => contact}
    end
  end
end