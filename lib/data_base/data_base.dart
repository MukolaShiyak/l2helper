import 'package:l2helper/data/models/resource_model.dart';

// DB DB DB
List<ResourceModel> draconicBow = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Draconic Bow',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/shaft.jpg',
    quantity: '17',
    title: 'Draconic Bow Shaft',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/ma.jpg',
    quantity: '375',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/sc.jpg',
    quantity: '75',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '150',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '75',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '212',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResourceModel(
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
List<ResourceModel> draconicBowLowRes = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Draconic Bow',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/shaft.jpg',
    quantity: '17',
    title: 'Draconic Bow Shaft',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '150',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '75',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '375',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '455',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '1365',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '3750',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Varnish.jpg',
    quantity: '5115',
    title: 'Varnish',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/coal.png',
    quantity: '675',
    title: 'coal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/charcoal.png',
    quantity: '675',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '75',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '212',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// AM AM AM

List<ResourceModel> arcanaMace = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Arcana Mace',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/amhead.jpg',
    quantity: '17',
    title: 'Arcana Mace Head',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/ma.jpg',
    quantity: '154',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/sc.jpg',
    quantity: '154',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '308',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '77',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResourceModel(
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
List<ResourceModel> arcanaMaceLowRes = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Arcana Mace',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/amhead.jpg',
    quantity: '17',
    title: 'Arcana Mace Head',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '308',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '154',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '154',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '234',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '702',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '1540',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Varnish.jpg',
    quantity: '2242',
    title: 'Varnish',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/coal.png',
    quantity: '1386',
    title: 'coal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/charcoal.png',
    quantity: '1386',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '77',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// HD HD HD
List<ResourceModel> heavensDivider = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Heavens Divider',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '17',
    title: 'Heavens Divider Edge',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/wh.jpg',
    quantity: '4',
    title: 'Warsmith Holder',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Maestro_Holder.jpg',
        quantity: '2',
        title: 'Maestro Holder',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Mold_Hardener.jpg',
            quantity: '10',
            title: 'Mold Hardener',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Mold_Lubricant.jpg',
            quantity: '10',
            title: 'Mold Lubricant',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '10',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Mold_Glue.jpg',
        quantity: '10',
        title: 'Mold Glue',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Thread.jpg',
        quantity: '20',
        title: 'Thread',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/ma.jpg',
    quantity: '292',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/sc.jpg',
    quantity: '146',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '146',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '146',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Sgem.jpg',
    quantity: '43',
    title: 'Gemstone S',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '20000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResourceModel(
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
List<ResourceModel> heavensDividerLowRes = [
  ResourceModel(
    image: 'images/Srec.jpg',
    quantity: '1',
    title: 'Recipe: Heavens Divider',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '17',
    title: 'Heavens Divider Edge',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '146',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '146',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '292',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '372',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '80',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Lubricant.jpg',
    quantity: '80',
    title: 'Mold Lubricant',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Glue.jpg',
    quantity: '40',
    title: 'Mold Glue',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Thread.jpg',
    quantity: '80',
    title: 'Thread',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '1116',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '2920',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Varnish.jpg',
    quantity: '4036',
    title: 'Varnish',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/coal.png',
    quantity: '1314',
    title: 'coal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/charcoal.png',
    quantity: '1314',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '146',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Scry.jpg',
    quantity: '211',
    title: 'Crystal S-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/ancient-adena.png',
    quantity: '4300000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// DLE DLE DLE
List<ResourceModel> darkLegion = [
  ResourceModel(
    image: 'images/recipeA.png',
    quantity: '1',
    title: "Recipe: Dark Legion's Edge(60%)",
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '14',
    title: 'Dark Legions Edge Blade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/steelMold.png',
    quantity: '3',
    title: 'Craftsman Mold',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/artisansFrame.jpg',
        quantity: '2',
        title: 'Artisans Frame',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/steelMold.png',
            quantity: '1',
            title: 'Steel Mold',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/braidedHemp.jpg',
                quantity: '5',
                title: 'Braided Hemp',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Iron_Ore.jpg',
                quantity: '5',
                title: 'Iron Ore',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/coal.png',
                quantity: '5',
                title: 'Coal',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
          ResourceModel(
            image: 'images/adamantinNugget.jpg',
            quantity: '10',
            title: 'Adamantite Nugget',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '5',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Mold_Hardener.jpg',
        quantity: '20',
        title: 'Mold Hardener',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/enria.jpg',
        quantity: '5',
        title: 'Enria',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/ma.jpg',
    quantity: '156',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/sc.jpg',
    quantity: '156',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '78',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '78',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/crystalA.png',
    quantity: '161',
    title: 'Crystal A-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/gemA.png',
    quantity: '74',
    title: 'Gemstone A',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/green_seal_stone.jpg',
        quantity: '6000',
        title: 'Green Seal Stone',
        isComplete: false,
        resources: [
          ResourceModel(
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
// dle low res
List<ResourceModel> darkLegionLowRes = [
  ResourceModel(
    image: 'images/recipeA.png',
    quantity: '1',
    title: "Recipe: Dark Legion's Edge(60%)",
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '14',
    title: 'Dark Legions Edge Blade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '78',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '156',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '156',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '186',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '60',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '558',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '1590',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Varnish.jpg',
    quantity: '2118',
    title: 'Varnish',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/coal.png',
    quantity: '1434',
    title: 'coal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/charcoal.png',
    quantity: '1404',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/braidedHemp.jpg',
    quantity: '30',
    title: 'Brainded Hemp',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/adamantinNugget.jpg',
    quantity: '60',
    title: 'Adamatite Nugget',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '93',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/crystalA.png',
    quantity: '161',
    title: 'Crystal A-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/ancient-adena.png',
    quantity: '2220000',
    title: 'Ancient Adena',
    isComplete: false,
  ),
];

// tallum blade
List<ResourceModel> tallumBlade = [
  ResourceModel(
    image: 'images/recipeA.png',
    quantity: '1',
    title: "Recipe: Tallum Blade(60%)",
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '13',
    title: 'Tallum Blade Edge',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/steelMold.png',
    quantity: '3',
    title: 'Craftsman Mold',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/artisansFrame.jpg',
        quantity: '2',
        title: 'Artisans Frame',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/steelMold.png',
            quantity: '1',
            title: 'Steel Mold',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/braidedHemp.jpg',
                quantity: '5',
                title: 'Braided Hemp',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Iron_Ore.jpg',
                quantity: '5',
                title: 'Iron Ore',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/coal.png',
                quantity: '5',
                title: 'Coal',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
          ResourceModel(
            image: 'images/adamantinNugget.jpg',
            quantity: '10',
            title: 'Adamantite Nugget',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish_of_Purity.jpg',
            quantity: '5',
            title: 'Varnish of Purity',
            isComplete: false,
            resources: [
              ResourceModel(
                image: 'images/Stone_of_Purity.jpg',
                quantity: '1',
                title: 'Stone of Purity',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Coarse_Bone_Powder.jpg',
                quantity: '3',
                title: 'Coarse Bone Powder',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
              ResourceModel(
                image: 'images/Varnish.jpg',
                quantity: '3',
                title: 'Varnish',
                isComplete: false,
                // enumLvl: ResourceLevel.fourth,
              ),
            ],
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Mold_Hardener.jpg',
        quantity: '20',
        title: 'Mold Hardener',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/enria.jpg',
        quantity: '5',
        title: 'Enria',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/ma.jpg',
    quantity: '82',
    title: 'Mithril Alloy',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '1',
        title: 'Mithril Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Varnish_of_Purity.jpg',
        quantity: '1',
        title: 'Varnish of Purity',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Stone_of_Purity.jpg',
            quantity: '1',
            title: 'Stone of Purity',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Coarse_Bone_Powder.jpg',
            quantity: '3',
            title: 'Coarse Bone Powder',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '3',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
      ResourceModel(
        image: 'images/Steel.jpg',
        quantity: '2',
        title: 'Steel',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/Iron_Ore.jpg',
            quantity: '5',
            title: 'Iron Ore',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/Varnish.jpg',
            quantity: '5',
            title: 'Varnish',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/sc.jpg',
    quantity: '82',
    title: 'Synthetic Cokes',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Oriharukon_Ore.jpg',
        quantity: '1',
        title: 'Oriharukon Ore',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Cokes.jpg',
        quantity: '3',
        title: 'Cokes',
        isComplete: false,
        resources: [
          ResourceModel(
            image: 'images/coal.png',
            quantity: '3',
            title: 'coal',
            isComplete: false,
          ),
          ResourceModel(
            image: 'images/charcoal.png',
            quantity: '3',
            title: 'Charcoal',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '41',
    title: 'Durable Metal Plate',
    isComplete: false,
    resources: [
      ResourceModel(
        image: 'images/Metallic_Thread.jpg',
        quantity: '5',
        title: 'Metallic Thread',
        isComplete: false,
      ),
      ResourceModel(
        image: 'images/Mithril_Ore.jpg',
        quantity: '5',
        title: 'Mithril Ore',
        isComplete: false,
      ),
    ],
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '41',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/cryB.png',
    quantity: '192',
    title: 'Crystal B-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/gemB.png',
    quantity: '143',
    title: 'Gemstone B',
    isComplete: false,
  ),
];

// tallum blade low res
List<ResourceModel> tallumBladeLowRes = [
  ResourceModel(
    image: 'images/recipeA.png',
    quantity: '1',
    title: "Recipe: Tallum Blade(60%)",
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/blade.jpg',
    quantity: '13',
    title: 'Tallum Blade Edge',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/dmp.jpg',
    quantity: '41',
    title: 'Durable Metal Plate',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Oriharukon_Ore.jpg',
    quantity: '82',
    title: 'Oriharukon Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mithril_Ore.jpg',
    quantity: '82',
    title: 'Mithril Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Stone_of_Purity.jpg',
    quantity: '112',
    title: 'Stone of Purity',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Mold_Hardener.jpg',
    quantity: '60',
    title: 'Mold Hardener',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Coarse_Bone_Powder.jpg',
    quantity: '336',
    title: 'Coarse Bone Powder',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Iron_Ore.jpg',
    quantity: '850',
    title: 'Iron Ore',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/Varnish.jpg',
    quantity: '1156',
    title: 'Varnish',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/coal.png',
    quantity: '768',
    title: 'coal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/charcoal.png',
    quantity: '738',
    title: 'Charcoal',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/braidedHemp.jpg',
    quantity: '30',
    title: 'Brainded Hemp',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/adamantinNugget.jpg',
    quantity: '60',
    title: 'Adamatite Nugget',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/enria.jpg',
    quantity: '56',
    title: 'Enria',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/cryB.png',
    quantity: '161',
    title: 'Crystal A-Grade',
    isComplete: false,
  ),
  ResourceModel(
    image: 'images/gemB.png',
    quantity: '143',
    title: 'Gemstone B',
    isComplete: false,
  ),
];
