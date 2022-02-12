import 'package:l2helper_v2/models/resource_model.dart';

// DB DB DB
List<ResouceModel> draconicBow = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Draconic Bow',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/shaft.jpg',
    quantity: '17',
    title: 'Draconic Bow Shaft',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResouceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
              ),
            ],
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/ma.jpg',
    quantity: '375',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/sc.jpg',
    quantity: '75',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '150',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '75',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '212',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/ancient-adena.png',
            quantity: '5',
            title: 'Ancient Adena',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
];

////////////////
// DBlow DBlow DBlow
List<ResouceModel> draconicBowLowRes = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Draconic Bow',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/shaft.jpg',
    quantity: '17',
    title: 'Draconic Bow Shaft',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '150',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '75',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '375',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '455',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '1365',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '3750',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Varnish.jpg',
    quantity: '5115',
    title: 'Varnish',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/coal.png',
    quantity: '675',
    title: 'coal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/charcoal.png',
    quantity: '675',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '75',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '212',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// AM AM AM

List<ResouceModel> arcanaMace = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Arcana Mace',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/amhead.jpg',
    quantity: '17',
    title: 'Arcana Mace Head',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResouceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
              ),
            ],
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/ma.jpg',
    quantity: '154',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/sc.jpg',
    quantity: '154',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '308',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '77',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/ancient-adena.png',
            quantity: '5',
            title: 'Ancient Adena',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
];

// AMlow AMlow AMlow
List<ResouceModel> arcanaMaceLowRes = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Arcana Mace',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/amhead.jpg',
    quantity: '17',
    title: 'Arcana Mace Head',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '308',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '154',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '154',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '234',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '702',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '1540',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Varnish.jpg',
    quantity: '2242',
    title: 'Varnish',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/coal.png',
    quantity: '1386',
    title: 'coal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/charcoal.png',
    quantity: '1386',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '77',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// HD HD HD
List<ResouceModel> heavensDivider = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Heavens Divider',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/blade.jpg',
    quantity: '17',
    title: 'Heavens Divider Edge',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResouceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
              ),
              ResouceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
              ),
            ],
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/ma.jpg',
    quantity: '292',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResouceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/sc.jpg',
    quantity: '146',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResouceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '146',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResouceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '146',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResouceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResouceModel(
            image: 'images/ancient-adena.png',
            quantity: '5',
            title: 'Ancient Adena',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
];

// HDlow HDlow HDlow
List<ResouceModel> heavensDividerLowRes = [
  ResouceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Heavens Divider',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/blade.jpg',
    quantity: '17',
    title: 'Heavens Divider Edge',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/dmp.jpg',
    quantity: '146',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '146',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '292',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '372',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '1116',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '2920',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Varnish.jpg',
    quantity: '4036',
    title: 'Varnish',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/coal.png',
    quantity: '1314',
    title: 'coal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/charcoal.png',
    quantity: '1314',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/enria.jpg',
    quantity: '146',
    title: 'Enria',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResouceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];
