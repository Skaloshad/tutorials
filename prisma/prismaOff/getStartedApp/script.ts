import { PrismaClient } from "@prisma/client"
import {
  createAlice
} from './querys'

const prisma = new PrismaClient()

async function main() {
  //const user = await createAlice(prisma)
  // const user = await prisma.user.create({
  //   data: {
  //     name: 'Bob',
  //     email: 'bob@prisma.io',
  //     posts: {
  //       create: {
  //         title: 'Hello World',
  //       },
  //     },
  //   },
  // })
  // console.log(user)
  const users = await prisma.user.findMany({
    include: {
      posts: true
    }
  })
  console.dir(users, { depth: null })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })