User.create email: 'admin@admin.ru', password: 'Sophia0!'

Category.create!([
  {name: "Портрет", order: 0},
  {name: "Натюрморт", order: 1},
  {name: "Пейзаж", order: 2},
  {name: "Графика", order: 3},
  {name: "Этюды", order: 0},
  {name: "Иллюстрация", order: 0}
])

Work.create!([
  {name: "Этюд 1", description: "Белые ночи. Архангельская область.\r\nБумага, масляная пастель.", size: "25х30см", category_id: 5, price: nil, enabled: true, image_file_name: "DSC_2922.jpg", image_content_type: "image/jpeg", image_file_size: 2505455, image_updated_at: "2015-03-21 16:56:53"},
  {name: "Натюрморт Trompe-l'œil", description: "Холст, масло", size: "60х60см", category_id: 2, price: nil, enabled: true, image_file_name: "DSC_1079.jpg", image_content_type: "image/jpeg", image_file_size: 1014659, image_updated_at: "2015-02-21 17:17:57"},
  {name: "Плакат «Русские Сезоны»", description: "Бумага, акварель, пастель, цветной карандаш", size: "60х90см", category_id: 4, price: 4500, enabled: true, image_file_name: "DSC_1108.jpg", image_content_type: "image/jpeg", image_file_size: 608000, image_updated_at: "2015-02-21 17:16:09"},
  {name: "Портрет", description: "Бумага, карандаш", size: "30х40см", category_id: 1, price: nil, enabled: true, image_file_name: "DSC_2720.jpg", image_content_type: "image/jpeg", image_file_size: 427355, image_updated_at: "2015-02-21 17:14:14"},
  {name: "Чернореченский каньон", description: "Бумага, масляная пастель", size: "19х21см", category_id: 5, price: 500, enabled: true, image_file_name: "DSC_1064-2.jpg", image_content_type: "image/jpeg", image_file_size: 1044388, image_updated_at: "2015-02-21 17:11:54"},
  {name: "Обнаженная модель", description: "Холст, масло\r\n40х80см", size: "", category_id: 1, price: 5000, enabled: true, image_file_name: "DSC_1088.jpg", image_content_type: "image/jpeg", image_file_size: 404424, image_updated_at: "2015-02-21 17:10:05"},
  {name: "Крым, ночной берег", description: "Холст, масло, деревянная рама", size: "30х40см", category_id: 3, price: 12000, enabled: true, image_file_name: "DSC_1113.jpg", image_content_type: "image/jpeg", image_file_size: 445911, image_updated_at: "2015-02-21 17:08:41"},
  {name: "Портрет беременной женщины", description: "Бумага, соус", size: "55х77см", category_id: 1, price: nil, enabled: true, image_file_name: "DSC_2723.jpg", image_content_type: "image/jpeg", image_file_size: 481200, image_updated_at: "2015-02-21 17:07:40"},
  {name: "Чернореченский каньон", description: "Бумага, масляная пастель", size: "30х21см", category_id: 5, price: 500, enabled: true, image_file_name: "DSC_1066-2.jpg", image_content_type: "image/jpeg", image_file_size: 831378, image_updated_at: "2015-02-21 17:06:03"},
  {name: "Портрет", description: "Холст, масло", size: "60х80см", category_id: 1, price: 7000, enabled: true, image_file_name: "DSC_1099.jpg", image_content_type: "image/jpeg", image_file_size: 645558, image_updated_at: "2015-02-21 17:01:56"},
  {name: "Натюрморт с утварью", description: "Бумага, темпера", size: "47х26см", category_id: 2, price: 3000, enabled: true, image_file_name: "DSC_1118.jpg", image_content_type: "image/jpeg", image_file_size: 513328, image_updated_at: "2015-02-21 16:59:59"},
  {name: "Натюрморт с овощами и кувшином", description: "Холаст, масло", size: "70х60см", category_id: 2, price: nil, enabled: true, image_file_name: "DSC_7941.jpg", image_content_type: "image/jpeg", image_file_size: 1010613, image_updated_at: "2015-02-21 16:52:13"},
  {name: "Портрет спящей", description: "Бумага, акварель", size: "49х69см", category_id: 1, price: 4000, enabled: true, image_file_name: "DSC_1076.jpg", image_content_type: "image/jpeg", image_file_size: 483398, image_updated_at: "2015-02-21 15:14:47"},
  {name: "Натюрморт с овощами", description: "Холст, масло", size: "80х60см", category_id: 2, price: 9000, enabled: true, image_file_name: "DSC_1106.jpg", image_content_type: "image/jpeg", image_file_size: 763462, image_updated_at: "2015-02-21 15:09:57"},
  {name: "Портрет дочери", description: "Бумага, красный и простой карандаши", size: "", category_id: 1, price: nil, enabled: true, image_file_name: "DSC_2718.jpg", image_content_type: "image/jpeg", image_file_size: 419860, image_updated_at: "2015-02-21 15:07:16"},
  {name: "Натюрморт с мандолиной", description: "Холст, масло", size: "70х40см", category_id: 2, price: nil, enabled: true, image_file_name: "DSC_7950.jpg", image_content_type: "image/jpeg", image_file_size: 812535, image_updated_at: "2015-02-21 15:06:01"}
])

