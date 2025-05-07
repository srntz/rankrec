module HomeHelper
  def render_navbutton(title, url, method)
    render partial: 'home/navbutton', locals: {
      title: title,
      url: url,
      httpmethod: method,
      style: "bg-white hover:bg-gray-400 transition px-4 py-2 rounded-lg text-black cursor-pointer"
    }
  end
end
