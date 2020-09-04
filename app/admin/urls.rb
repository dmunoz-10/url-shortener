# frozen_string_literal: true

ActiveAdmin.register Url do
  permit_params :url

  index do
    selectable_column
    id_column
    column :url do |url|
      url.url.truncate 40
    end
    column :short_url do |url|
      show_url_url(url).truncate 40
    end
    column :created_at
    actions
  end

  show do |url|
    attributes_table do
      row :id
      row :url do
        link_to url.url
      end
      row :short_url do
        link_to show_url_url(url)
      end
      row :created_at
      row :updated_at
    end
  end

  filter :id
  filter :url
  filter :created_at

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs do
      f.input :url
    end
    f.actions
  end
end
